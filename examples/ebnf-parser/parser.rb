# EBNF Parser for EBNF.
# Produces an Abstract Synatx Tree in S-Expression form for the input grammar file
require 'ebnf/rule'
require 'ebnf/ll1/parser'
require 'meta'
require 'terminals'

class EBNFParser
  include EBNF::LL1::Parser
  include EBNFParserMeta
  include EBNFParserTerminals

  # Abstract syntax tree from parse
  #
  # @return [Array<EBNF::Rule>]
  attr_reader :ast

  # Grammar errors, or errors found genering parse tables
  #
  # @return [Array<String>]
  attr_accessor :errors

  # Define rules for Terminals, placing results on the input stack, making them available to upstream non-Terminal rules.
  # These terminals are matched in this order based on the FIRST terminals of a production
  terminal(:LHS, LHS) do |prod, token, input|
    input[:id], input[:symbol] = token.value.to_s.scan(/\[([^\]]+\])\s*(\w+)\s*::=/)
  end

  terminal(:SYMBOL, SYMBOL) do |prod, token, input|
    input[:primary] = token.value.to_sym
  end

  terminal(:RANGE, RANGE) do |prod, token, input|
    input[:range] = token.value[1..-2]
  end

  terminal(:ENUM, ENUM) do |prod, token, input|
    input[:range] = token.value[1..-2]
  end

  terminal(:O_RANGE, O_RANGE) do |prod, token, input|
    input[:range] = token.value[1..-2]
  end

  terminal(:O_ENUM, O_ENUM) do |prod, token, input|
    input[:range] = token.value[1..-2]
  end

  terminal(:STRING1, STRING1) do |prod, token, input|
    input[:primary] = token.value[1..-2]
  end

  terminal(:STRING2, STRING2) do |prod, token, input|
    input[:primary] = token.value[1..-2]
  end

  terminal(:POSTFIX, POSTFIX) do |prod, token, input|
    input[:postfix] = token.value
  end

  # String terminals defined within rules, not as explicit terminals
  terminal(nil,                  %r(@terminals|@pass|[\[\]|\-\(\)])) do |prod, token, input|
    input[:terminal] = token.value
  end

  # Define productions for non-Termainals. This can include start_production as well as production to hook into rule start and end.

  # Production for end of declaration non-terminal.
  # The `input` parameter includes information placed by previous productions at the same level, or at the start of the current production.
  # The `current` parameter, is the result of child productions placing information onto their input.
  # The `callback` parameter provides access to a callback defined in the call to `parse`, see `#each_rule` below).
  #
  # [2] declaration ::= '@terminals' | pass
  production(:declaration) do |input, current, callback|
    # If seeing "@terminals", all subsequent rules are treated as terminals
    # Otherwise, it's `pass`
  end

  # Production for end of rule non-terminal.
  # The `input` parameter includes information placed by previous productions at the same level, or at the start of the current production.
  # The `current` parameter, is the result of child productions placing information onto their input.
  # The `callback` parameter provides access to a callback defined in the call to `parse`, see `#each_rule` below).
  production(:rule) do |input, current, callback|
    # current contains a declaration
    # Invoke callback
    callback.call(:rule, current[:rule])
  end

  # On start, yield ourselves if a block is given, otherwise, return this parser instance
  #
  # @param  [#read, #to_s]          input
  # @param  [Hash{Symbol => Object}] options
  # @option options [Hash]     :prefixes     (Hash.new)
  #   the prefix mappings to use (for acessing intermediate parser productions)
  # @option options [Boolean] :progress
  #   Show progress of parser productions
  # @return [EBNFParser]
  def initialize(input, options = {}, &block)
    @options = options.dup
    @input = input.respond_to?(:read) ? input.read : input.to_s
    if block_given?
      case block.arity
        when 0 then instance_eval(&block)
        else block.call(self)
      end
      close(@input)
    end
  end

  # Return each rule
  #
  # @yield rule
  # @yieldparam [EBNF::Rule] rule
  def each(&block)
    parsing_terminals = false
    @ast = []
    breakpoint
    parse(@input, START.to_sym, @options.merge(:branch => BRANCH,
                                               :first => FIRST,
                                               :follow => FOLLOW,
                                               :whitespace => EBNFParserTerminals::PASS,
                                               :reset_on_start => true)
    ) do |context, *data|
      rule = case context
      when :terminal
        parsing_terminals = true
        next
      when :pass
        rule = EBNF::Rule(:@pass, nil, data.first, :kind => :pass)
      when :rule
        rule = data.first
        rule.kind = :terminal if parsing_terminals
        rule
      when :trace
        level, lineno, depth, *args = data
        message = "#{args.join(': ')}"
        d_str = depth > 100 ? ' ' * 100 + '+' : ' ' * depth
        $stderr.puts "[#{lineno}](#{level})#{d_str}#{message}"
        next
      end
      @ast << rule
      yield rule
    end
  end
end
