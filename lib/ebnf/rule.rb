module EBNF
  # Represent individual parsed rules
  class Rule
    # Operations which are flattened to seprate rules in to_bnf
    BNF_OPS = %w{
      alt opt plus seq star
    }.map(&:to_sym).freeze

    TERM_OPS = %w{
      diff hex range
    }.map(&:to_sym).freeze

    # @!attribute [rw] sym for rule
    # @return [Symbol]
    attr_accessor :sym

    # @!attribute [rw] id of rule
    # @return [String]
    attr_accessor :id

    # A comprehension is a sequence which contains all elements but the first of the original rule.
    # @!attribute [rw] comprehension of this rule
    # @return [Rule]
    attr_accessor :comp

    # @!attribute [rw] kind of rule
    # @return [:rule, :terminal, or :pass]
    attr_accessor :kind

    # @!attribute [rw] expr rule expression
    # @return [Array]
    attr_accessor :expr

    # @!attribute [rw] orig original rule
    # @return [String]
    attr_accessor :orig

    # @!attribute [r] first terminals that immediately procede this rule
    # @return [Array<Rule>]
    attr_reader :first

    # @!attribute [r] follow terminals that immediately follow this rule
    # @return [Array<Rule>]
    attr_reader :follow

    # @!attribute [rw] start indicates that this is a starting rule
    # @return [Boolean]
    attr_accessor :start

    # @param [Integer] id
    # @param [Symbol] sym
    # @param [Array] expr
    # @param [Hash{Symbol => Object}] options
    # @option options [Symbol] :kind
    # @option options [String] :ebnf
    def initialize(sym, id, expr, options = {})
      @sym, @id = sym, id
      @expr = expr.is_a?(Array) ? expr : [:seq, expr]
      @ebnf = options[:ebnf]
      @top_rule = options.fetch(:top_rule, self)
      @kind = case
      when options[:kind] then options[:kind]
      when sym.to_s == sym.to_s.upcase then :terminal
      when !BNF_OPS.include?(@expr.first) then :terminal
      else :rule
      end
    end

    # Build a new rule creating a symbol and numbering from the current rule
    # Symbol and number creation is handled by the top-most rule in such a chain
    #
    # @param [Array] expr
    # @param [Hash{Symbol => Object}] options
    # @option options [Symbol] :kind
    # @option options [String] :ebnf EBNF instance (used for messages)
    def build(expr, options = {})
      new_sym, new_id = (@top_rule ||self).send(:make_sym_id)
      Rule.new(new_sym, new_id, expr, {
        :kind => options[:kind],
        :ebnf => @ebnf,
        :top_rule => @top_rule || self,
      }.merge(options))
    end

    # Serializes this rule to an S-Expression
    # @return [String]
    def to_sxp
      elements = [kind, sym, id]
      elements << [:start, true] if start
      elements << first.sort_by(&:to_s).unshift(:first) if first
      elements << follow.sort_by(&:to_s).unshift(:follow) if follow
      elements << expr
      begin
        require 'sxp'
        SXP::Generator.string(elements)
      rescue LoadError
        elements.to_sxp
      end
    end
    def to_s; to_sxp; end
    
    # Serializes this rule to an Turtle
    # @return [String]
    def to_ttl
      @ebnf.debug("to_ttl") {inspect}
      comment = orig.strip.
        gsub(/"""/, '\"\"\"').
        gsub("\\", "\\\\").
        sub(/^\"/, '\"').
        sub(/\"$/m, '\"')
      statements = [
        %{:#{id} rdfs:label "#{id}"; rdf:value "#{sym}";},
        %{  rdfs:comment #{comment.inspect};},
      ]
      
      statements += ttl_expr(expr, kind == :terminal ? "re" : "g", 1, false)
      "\n" + statements.join("\n")
    end

    ##
    # Transform EBNF rule to BNF rules:
    #
    #   * Transform (a [n] rule (op1 (op2))) into two rules:
    #     (a [n] rule (op1 a.2))
    #     (_a_1 [n.1] rule (op2))
    #   * Transform (a rule (opt b)) into (a rule (alt _empty "foo"))
    #   * Transform (a rule (star b)) into (a rule (alt _empty (seq b a)))
    #   * Transform (a rule (plus b)) into (a rule (seq b (star b)
    # @return [Array<Rule>]
    def to_bnf
      return [self] unless kind == :rule
      new_rules = []

      # Look for rules containing recursive definition and rewrite to multiple rules. If `expr` contains elements which are in array form, where the first element of that array is a symbol, create a new rule for it.
      if expr.any? {|e| e.is_a?(Array) && (BNF_OPS + TERM_OPS).include?(e.first)}
        #   * Transform (a [n] rule (op1 (op2))) into two rules:
        #     (a.1 [n.1] rule (op1 a.2))
        #     (a.2 [n.2] rule (op2))
        # duplicate ourselves for rewriting
        this = dup
        new_rules << this

        expr.each_with_index do |e, index|
          next unless e.is_a?(Array) && e.first.is_a?(Symbol)
          new_rule = build(e)
          this.expr[index] = new_rule.sym
          new_rules << new_rule
        end

        # Return new rules after recursively applying #to_bnf
        new_rules = new_rules.map {|r| r.to_bnf}.flatten
      elsif expr.first == :opt
        this = dup
        #   * Transform (a rule (opt b)) into (a rule (alt _empty b))
        this.expr = [:alt, :_empty, expr.last]
        new_rules = this.to_bnf
      elsif expr.first == :star
        #   * Transform (a rule (star b)) into (a rule (alt _empty (seq b a)))
        this = dup
        new_rule = this.build([:seq, expr.last, this.sym])
        this.expr = [:alt, :_empty, new_rule.sym]
        new_rules = [this] + new_rule.to_bnf
      elsif expr.first == :plus
        #   * Transform (a rule (plus b)) into (a rule (seq b (star b)
        this = dup
        this.expr = [:seq, expr.last, [:star, expr.last]]
        new_rules = this.to_bnf
      elsif [:alt, :seq].include?(expr.first)
        # Otherwise, no further transformation necessary
        new_rules << self
      elsif [:diff, :hex, :range].include?(expr.first)
        # This rules are fine, the just need to be terminals
        raise "Encountered #{expr.first.inspect}, which is a #{self.kind}, not :terminal" unless self.kind == :terminal
        new_rules << self
      else
        # Some case we didn't think of
        raise "Error trying to transform #{expr.inspect} to BNF"
      end
      
      return new_rules
    end

    # Does this rule start with a sym? It does if expr is that sym,
    # expr starts with alt and contains that sym, or
    # expr starts with seq and the next element is that sym
    # @param [Symbol, class] sym
    #   Symbol matching any start element, or if it is String, any start element which is a String
    # @return [Array<Symbol, String>] list of symbol (singular), or strings which are start symbol, or nil if there are none
    def starts_with(sym)
      if seq? && sym === (v = expr.fetch(1, nil))
        [v]
      elsif alt? && expr.any? {|e| sym === e}
        expr.select {|e| sym === e}
      else
        nil
      end
    end

    # Add terminal as proceding this rule
    # @param [Array<Rule>] terminals
    # @return [Integer] if number of terminals added
    def add_first(terminals)
      @first ||= []
      terminals -= @first  # Remove those already in first
      @first += terminals
      terminals.length
    end

    # Add terminal as following this rule. Don't add _eps as a follow
    #
    # @param [Array<Rule>] terminals
    # @return [Integer] if number of terminals added
    def add_follow(terminals)
      terminals -= @follow || []  # Remove those already in first
      terminals -= [:_eps]  # Special case, don't add empty string as a follow terminal
      unless terminals.empty?
        @follow ||= []
        @follow += terminals
      end
      terminals.length
    end

    # Is this rule of the form (seq ...)?
    def seq?
      expr.is_a?(Array) && expr.first == :seq
    end

    # Is this rule of the form (alt ...)?
    def alt?
      expr.is_a?(Array) && expr.first == :alt
    end

    def inspect
      "#<EBNF::Rule:#{object_id} " +
      {:sym => sym, :id => id, :kind => kind, :expr => expr}.inspect +
      ">"
    end

    # Two rules are equal if they have the same {#sym}, {#kind} and {#expr}
    # @param [Rule] other
    # @return [Boolean]
    def ==(other)
      sym   == other.sym &&
      kind  == other.kind &&
      expr  == other.expr
    end

    # Two rules are equivalent if they have the same {#expr}
    # @param [Rule] other
    # @return [Boolean]
    def equivalent?(other)
      expr  == other.expr
    end

    # Rewrite the rule substituting src_rule for dst_rule wherever
    # it is used in the production (first level only).
    # @param [Rule] src_rule
    # @param [Rule] dst_rule
    # @return [Rule]
    def rewrite(src_rule, dst_rule)
      case @expr
      when Array
        @expr = @expr.map {|e| e == src_rule.sym ? dst_rule.sym : e}
      else
        @expr = dst_rule.sym if @expr == src_rule.sym
      end
      self
    end

    # Rules compare using their ids
    def <=>(other)
      if id.to_i == other.id.to_i
        id <=> other.id
      else
        id.to_i <=> other.id.to_i
      end
    end

    private
    def ttl_expr(expr, pfx, depth, is_obj = true)
      indent = '  ' * depth
      @ebnf.debug("ttl_expr", :depth => depth) {expr.inspect}
      op = expr.shift if expr.is_a?(Array)
      statements = []
      
      if is_obj
        bra, ket = "[ ", " ]"
      else
        bra = ket = ''
      end

      case op
      when :seq, :alt, :diff
        statements << %{#{indent}#{bra}#{pfx}:#{op} (}
        expr.each {|a| statements += ttl_expr(a, pfx, depth + 1)}
        statements << %{#{indent} )#{ket}}
      when :opt, :plus, :star
        statements << %{#{indent}#{bra}#{pfx}:#{op} }
        statements += ttl_expr(expr.first, pfx, depth + 1)
        statements << %{#{indent} #{ket}} unless ket.empty?
      when :_empty, :_eps, :_empty
        statements << %{#{indent}"g:#{op.to_s[1..-1]}"}
      when :"'"
        statements << %{#{indent}"#{esc(expr)}"}
      when :range
        statements << %{#{indent}#{bra} re:matches #{cclass(expr.first).inspect} #{ket}}
      when :hex
        raise "didn't expect \" in expr" if expr.include?(:'"')
        statements << %{#{indent}#{bra} re:matches #{cclass(expr.first).inspect} #{ket}}
      else
        if is_obj
          statements << %{#{indent}#{expr.inspect}}
        else
          statements << %{#{indent}g:seq ( #{expr.inspect} )}
        end
      end
      
      statements.last << " ." unless is_obj
      @ebnf.debug("statements", :depth => depth) {statements.join("\n")}
      statements
    end
    
    ##
    # turn an XML BNF character class into an N3 literal for that
    # character class (less the outer quote marks)
    #
    #     >>> cclass("^<>'{}|^`")
    #     "[^<>'{}|^`]"
    #     >>> cclass("#x0300-#x036F")
    #     "[\\u0300-\\u036F]"
    #     >>> cclass("#xC0-#xD6")
    #     "[\\u00C0-\\u00D6]"
    #     >>> cclass("#x370-#x37D")
    #     "[\\u0370-\\u037D]"
    #     
    #     as in: ECHAR ::= '\' [tbnrf\"']
    #     >>> cclass("tbnrf\\\"'")
    #     'tbnrf\\\\\\"\''
    #     
    #     >>> cclass("^#x22#x5C#x0A#x0D")
    #     '^\\u0022\\\\\\u005C\\u000A\\u000D'
    def cclass(txt)
      '[' +
      txt.gsub(/\#x[0-9a-fA-F]+/) do |hx|
        hx = hx[2..-1]
        if hx.length <= 4
          "\\u#{'0' * (4 - hx.length)}#{hx}" 
        elsif hx.length <= 8
          "\\U#{'0' * (8 - hx.length)}#{hx}" 
        end
      end +
      ']'
    end

    # Make a new symbol/number combination
    def make_sym_id
      @id_seq ||= 0
      @id_seq += 1
      ["_#{@sym}_#{@id_seq}".to_sym, "#{@id}.#{@id_seq}"]
    end
  end
end