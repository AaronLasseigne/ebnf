# This file is automatically generated by /Users/gregg/Projects/ebnf/lib/ebnf/base.rb
# BRANCH derived from star.ebnf
module StarParserMeta
  START = :foo

  BRANCH = {
    :foo => {
      "a" => [:_foo_1],
    },
    :_foo_1 => {
      "a" => ["a", :foo],
    },
  }.freeze
  TERMINALS = [
    "a"
  ].freeze
  FIRST = {
    :_empty => [
      :_eps],
    :foo => [
      :_eps,
      "a"],
    :_foo_1 => [
      "a"],
    :_foo_2 => [
      "a",
      :_eps],
  }.freeze
  FOLLOW = {
    :foo => [
      :_eof],
    :_foo_1 => [
      :_eof],
    :_foo_2 => [
      :_eof],
  }.freeze
  CLEANUP = {
    :foo => :star,
    :_foo_1 => :merge,
  }.freeze
end

