# coding: utf-8
$:.unshift "."
require 'spec_helper'
require 'ebnf'
require 'sxp'

describe EBNF::Base do
  describe "#first_follow" do
    context "start" do
      context "with legitimate start rule" do
        let!(:ebnf_doc) {
          parse(%([1] ebnf        ::= (declaration | rule)*), :start => [:ebnf])
        }
        let(:rule) {ebnf_doc.ast.detect {|r| r.sym == :ebnf}}
        it "should include rule" do
          rule.should_not be_nil
        end

        context "start rule" do
          subject {rule}
          its(:start) {rule.start.should be_true}
          its(:follow) {should include(:_eof)}
        end
      end

      context "with illegitimate start rule" do
        specify {
          lambda {parse(%([1] ebnf        ::= (declaration | rule)*), :start => [:foo])
        }.should raise_error("No rule found for start symbol foo")}
      end
    end

    context "comprehensions" do
      {
        "alt" => [
          %{[1] ebnf        ::= declaration | rule},
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule ebnf "1" (alt declaration rule)))
          }
        ],
        "seq[1]" => [
          %{[1] rule::= a b },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule rule "1" (seq a b))
             (rule _rule_comp "1.comp" (seq b)))
          }
        ],
        "blankNodePropertyList" => [
          %{[14] blankNodePropertyList            ::= "[" predicateObjectList "]"},
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule blankNodePropertyList "14" (first "[") (seq "[" predicateObjectList "]"))
             (rule _blankNodePropertyList_comp "14.comp" (seq predicateObjectList "]"))
             (rule __blankNodePropertyList_comp_comp "14.comp.comp" (first "]") (seq "]")))
          }
        ]
      }.each do |name, (input, expected)|
        it name do
          ebnf = parse(input)
          sin = ebnf.ast.sort.to_sxp
          sin.should produce(expected, @debug)
        end
      end
    end

    context "first" do
      {
        "alt (FF.1)" => [
          %{
            [5] base                              ::= '@base' IRIREF "."
          },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule base "5" (first "@base") (seq "@base" IRIREF "."))
             (rule _base_comp "5.comp" (seq IRIREF "."))
             (rule __base_comp_comp "5.comp.comp" (first ".") (seq ".")))
          }, []
        ],
        "sparqlPrefix (FF.1)" => [
          %{
            [29s] sparqlBase                      ::= SPARQL_BASE IRIREF
            [18] IRIREF                           ::=  '<' ("range" | UCHAR)* '>'
            [29t] SPARQL_BASE                     ::= [Bb][Aa][Ss][Ee]
          },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (terminal IRIREF "18" (seq "<" (star (alt "range" UCHAR)) ">"))
             (rule sparqlBase "29s" (first SPARQL_BASE) (seq SPARQL_BASE IRIREF))
             (rule _sparqlBase_comp "29s.comp" (first IRIREF) (seq IRIREF))
             (terminal SPARQL_BASE "29t" (seq (range "Bb") (range "Aa") (range "Ss") (range "Ee"))))
          }, []
        ],
        "declaration (FF.1)" => [
          %{
            [2] declaration ::= '@terminals' | '@pass'
          },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule declaration "2" (first "@pass" "@terminals") (alt "@terminals" "@pass")))
          }, []
        ],
        "turtleDoc (FF.2)" => [
          %{
            [1] turtleDoc                         ::= statement* 
            [2] statement                         ::= directive | triples "." 
          },
          %{
            ((rule _empty "0" (first _eps) (follow _eof) (seq))
             (rule turtleDoc "1" (start #t) (first _eps) (follow _eof)
              (alt _empty _turtleDoc_star))
             (rule _turtleDoc_star "1*" (follow _eof) (seq statement turtleDoc))
             (rule __turtleDoc_star_comp "1*.comp" (first _eps) (follow _eof) (seq turtleDoc))
             (rule statement "2" (alt directive _statement_1))
             (rule _statement_1 "2.1" (seq triples "."))
             (rule __statement_1_comp "2.1.comp" (first ".") (seq ".")))
          }, [:turtleDoc]
        ]
      }.each do |name, (input, expected, start)|
        it name do
          ebnf = parse(input, :start => start)
          sin = ebnf.ast.sort.to_sxp
          sin.should produce(expected, @debug)
        end
      end
    end

    context "follow" do
      {
        "objectList (FF.3)" => [
          %{
            [1] rule1 ::= a b
            [2] a     ::= "foo"
            [3] b     ::= "bar"
          },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule rule1 "1" (first "foo") (seq a b))
             (rule _rule1_comp "1.comp" (first "bar") (seq b))
             (rule a "2" (first "foo") (follow "bar") (seq "foo"))
             (rule b "3" (first "bar") (seq "bar")))
          }
        ],
        "blankNodePropertyList (FF.4)" => [
          %{
            [7] predicateObjectList               ::= verb objectList
            [14] blankNodePropertyList            ::= "[" predicateObjectList "]"
          },
          %{
            ((rule _empty "0" (first _eps) (seq))
             (rule predicateObjectList "7" (follow "]") (seq verb objectList))
             (rule _predicateObjectList_comp "7.comp" (follow "]") (seq objectList))
             (rule blankNodePropertyList "14" (first "[") (seq "[" predicateObjectList "]"))
             (rule _blankNodePropertyList_comp "14.comp" (seq predicateObjectList "]"))
             (rule __blankNodePropertyList_comp_comp "14.comp.comp" (first "]") (seq "]")))
          }
        ],
        "collection (FF.6/7)" => [
          %{
            [15] collection                       ::= "(" object* ")"
          },
          %{
            ((rule _empty "0" (first _eps) (follow ")") (seq))
             (rule collection "15" (first "(") (seq "(" _collection_1 ")"))
             (rule _collection_1 "15.1" (first _eps) (follow ")") (alt _empty __collection_1_star))
             (rule __collection_1_star "15.1*" (follow ")") (seq object _collection_1))
             (rule ___collection_1_star_comp "15.1*.comp" (first _eps) (follow ")") (seq _collection_1))
             (rule _collection_comp "15.comp" (first _eps) (seq _collection_1 ")"))
             (rule __collection_comp_comp "15.comp.comp" (first ")") (seq ")")))
          }
        ]
      }.each do |name, (input, expected)|
        it name do
          ebnf = parse(input)
          sin = ebnf.ast.sort.to_sxp
          sin.should produce(expected, @debug)
        end
      end
    end

  end
  
  def parse(value, options = {})
    @debug = []
    options = {:debug => @debug}.merge(options)
    ebnf = EBNF::Base.new(value, options)
    ebnf.make_bnf
    @debug.clear
    ebnf.first_follow(options[:start] || [])
    ebnf
  end
end
