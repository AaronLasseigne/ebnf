# This file is automatically generated by bin/ebnf
# BRANCH derived from etc/turtle.ebnf
module RDF::Turtle::Meta
  START = :turtleDoc

  BRANCH = {
    :BlankNode => {
      "(" => [],
      "," => [],
      :ANON => [:ANON],
      :BLANK_NODE_LABEL => [:BLANK_NODE_LABEL],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "a" => [],
      "false" => [],
      "true" => [],
    },
    :BooleanLiteral => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "false" => ["false"],
      "true" => ["true"],
    },
    :NumericLiteral => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [:DECIMAL],
      :DOUBLE => [:DOUBLE],
      :INTEGER => [:INTEGER],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "false" => [],
      "true" => [],
    },
    :PrefixedName => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [:PNAME_LN],
      :PNAME_NS => [:PNAME_NS],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "a" => [],
      "false" => [],
      "true" => [],
    },
    :RDFLiteral => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [:String, :_RDFLiteral_1],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:String, :_RDFLiteral_1],
      :STRING_LITERAL_QUOTE => [:String, :_RDFLiteral_1],
      :STRING_LITERAL_SINGLE_QUOTE => [:String, :_RDFLiteral_1],
      "[" => [],
      "false" => [],
      "true" => [],
    },
    :String => {
      :LANGTAG => [],
      :STRING_LITERAL_LONG_QUOTE => [:STRING_LITERAL_LONG_QUOTE],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:STRING_LITERAL_LONG_SINGLE_QUOTE],
      :STRING_LITERAL_QUOTE => [:STRING_LITERAL_QUOTE],
      :STRING_LITERAL_SINGLE_QUOTE => [:STRING_LITERAL_SINGLE_QUOTE],
      "^^" => [],
    },
    :_RDFLiteral_1 => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :LANGTAG => [:_RDFLiteral_2],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "^^" => [:_RDFLiteral_2],
      :_empty => [],
      "false" => [],
      "true" => [],
    },
    :_RDFLiteral_2 => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :LANGTAG => [:LANGTAG],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "^^" => [:_RDFLiteral_3],
      "false" => [],
      "true" => [],
    },
    :_RDFLiteral_3 => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "^^" => ["^^", :iri],
      "false" => [],
      "true" => [],
    },
    :_collection_1 => {
      "(" => [:_collection_2],
      ")" => [],
      :ANON => [:_collection_2],
      :BLANK_NODE_LABEL => [:_collection_2],
      :DECIMAL => [:_collection_2],
      :DOUBLE => [:_collection_2],
      :INTEGER => [:_collection_2],
      :IRIREF => [:_collection_2],
      :PNAME_LN => [:_collection_2],
      :PNAME_NS => [:_collection_2],
      :STRING_LITERAL_LONG_QUOTE => [:_collection_2],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:_collection_2],
      :STRING_LITERAL_QUOTE => [:_collection_2],
      :STRING_LITERAL_SINGLE_QUOTE => [:_collection_2],
      "[" => [:_collection_2],
      :_empty => [],
      "false" => [:_collection_2],
      "true" => [:_collection_2],
    },
    :_collection_2 => {
      "(" => [:object, :_collection_1],
      ")" => [],
      :ANON => [:object, :_collection_1],
      :BLANK_NODE_LABEL => [:object, :_collection_1],
      :DECIMAL => [:object, :_collection_1],
      :DOUBLE => [:object, :_collection_1],
      :INTEGER => [:object, :_collection_1],
      :IRIREF => [:object, :_collection_1],
      :PNAME_LN => [:object, :_collection_1],
      :PNAME_NS => [:object, :_collection_1],
      :STRING_LITERAL_LONG_QUOTE => [:object, :_collection_1],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:object, :_collection_1],
      :STRING_LITERAL_QUOTE => [:object, :_collection_1],
      :STRING_LITERAL_SINGLE_QUOTE => [:object, :_collection_1],
      "[" => [:object, :_collection_1],
      "false" => [:object, :_collection_1],
      "true" => [:object, :_collection_1],
    },
    :_objectList_1 => {
      "," => [:_objectList_3],
      ";" => [],
      :_empty => [],
    },
    :_objectList_2 => {
      "," => [",", :object],
    },
    :_objectList_3 => {
      "," => [:_objectList_2, :_objectList_1],
      ";" => [],
    },
    :_predicateObjectList_1 => {
      "." => [],
      ";" => [:_predicateObjectList_3],
      "]" => [],
      :_empty => [],
    },
    :_predicateObjectList_2 => {
      ";" => [";", :_predicateObjectList_4],
    },
    :_predicateObjectList_3 => {
      "." => [],
      ";" => [:_predicateObjectList_2, :_predicateObjectList_1],
      "]" => [],
    },
    :_predicateObjectList_4 => {
      ";" => [],
      :IRIREF => [:_predicateObjectList_5],
      :PNAME_LN => [:_predicateObjectList_5],
      :PNAME_NS => [:_predicateObjectList_5],
      :_empty => [],
      "a" => [:_predicateObjectList_5],
    },
    :_predicateObjectList_5 => {
      ";" => [],
      :IRIREF => [:verb, :objectList],
      :PNAME_LN => [:verb, :objectList],
      :PNAME_NS => [:verb, :objectList],
      "a" => [:verb, :objectList],
    },
    :_statement_1 => {
      "(" => [:triples, "."],
      "@base" => [],
      "@prefix" => [],
      :ANON => [:triples, "."],
      :BLANK_NODE_LABEL => [:triples, "."],
      :IRIREF => [:triples, "."],
      :PNAME_LN => [:triples, "."],
      :PNAME_NS => [:triples, "."],
      :SPARQL_BASE => [],
      :SPARQL_PREFIX => [],
      "[" => [:triples, "."],
    },
    :_triples_1 => {
      "(" => [:subject, :predicateObjectList],
      "." => [],
      :ANON => [:subject, :predicateObjectList],
      :BLANK_NODE_LABEL => [:subject, :predicateObjectList],
      :IRIREF => [:subject, :predicateObjectList],
      :PNAME_LN => [:subject, :predicateObjectList],
      :PNAME_NS => [:subject, :predicateObjectList],
    },
    :_triples_2 => {
      "." => [],
      "[" => [:blankNodePropertyList, :_triples_3],
    },
    :_triples_3 => {
      "." => [],
      :IRIREF => [:predicateObjectList],
      :PNAME_LN => [:predicateObjectList],
      :PNAME_NS => [:predicateObjectList],
      :_empty => [],
      "a" => [:predicateObjectList],
    },
    :_turtleDoc_1 => {
      "(" => [:statement, :turtleDoc],
      "@base" => [:statement, :turtleDoc],
      "@prefix" => [:statement, :turtleDoc],
      :ANON => [:statement, :turtleDoc],
      :BLANK_NODE_LABEL => [:statement, :turtleDoc],
      :IRIREF => [:statement, :turtleDoc],
      :PNAME_LN => [:statement, :turtleDoc],
      :PNAME_NS => [:statement, :turtleDoc],
      :SPARQL_BASE => [:statement, :turtleDoc],
      :SPARQL_PREFIX => [:statement, :turtleDoc],
      "[" => [:statement, :turtleDoc],
      :_eof => [],
    },
    :base => {
      "(" => [],
      "@base" => ["@base", :IRIREF, "."],
      "@prefix" => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :SPARQL_BASE => [],
      :SPARQL_PREFIX => [],
      "[" => [],
    },
    :blankNodePropertyList => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => ["[", :predicateObjectList, "]"],
      "a" => [],
      "false" => [],
      "true" => [],
    },
    :collection => {
      "(" => ["(", :_collection_1, ")"],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "a" => [],
      "false" => [],
      "true" => [],
    },
    :directive => {
      "(" => [],
      "@base" => [:base],
      "@prefix" => [:prefixID],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :SPARQL_BASE => [:sparqlBase],
      :SPARQL_PREFIX => [:sparqlPrefix],
      "[" => [],
    },
    :iri => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [:IRIREF],
      :PNAME_LN => [:PrefixedName],
      :PNAME_NS => [:PrefixedName],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "a" => [],
      "false" => [],
      "true" => [],
    },
    :literal => {
      "(" => [],
      "," => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [:NumericLiteral],
      :DOUBLE => [:NumericLiteral],
      :INTEGER => [:NumericLiteral],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :STRING_LITERAL_LONG_QUOTE => [:RDFLiteral],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:RDFLiteral],
      :STRING_LITERAL_QUOTE => [:RDFLiteral],
      :STRING_LITERAL_SINGLE_QUOTE => [:RDFLiteral],
      "[" => [],
      "false" => [:BooleanLiteral],
      "true" => [:BooleanLiteral],
    },
    :object => {
      "(" => [:collection],
      "," => [],
      :ANON => [:BlankNode],
      :BLANK_NODE_LABEL => [:BlankNode],
      :DECIMAL => [:literal],
      :DOUBLE => [:literal],
      :INTEGER => [:literal],
      :IRIREF => [:iri],
      :PNAME_LN => [:iri],
      :PNAME_NS => [:iri],
      :STRING_LITERAL_LONG_QUOTE => [:literal],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:literal],
      :STRING_LITERAL_QUOTE => [:literal],
      :STRING_LITERAL_SINGLE_QUOTE => [:literal],
      "[" => [:blankNodePropertyList],
      "false" => [:literal],
      "true" => [:literal],
    },
    :objectList => {
      "(" => [:object, :_objectList_1],
      ";" => [],
      :ANON => [:object, :_objectList_1],
      :BLANK_NODE_LABEL => [:object, :_objectList_1],
      :DECIMAL => [:object, :_objectList_1],
      :DOUBLE => [:object, :_objectList_1],
      :INTEGER => [:object, :_objectList_1],
      :IRIREF => [:object, :_objectList_1],
      :PNAME_LN => [:object, :_objectList_1],
      :PNAME_NS => [:object, :_objectList_1],
      :STRING_LITERAL_LONG_QUOTE => [:object, :_objectList_1],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [:object, :_objectList_1],
      :STRING_LITERAL_QUOTE => [:object, :_objectList_1],
      :STRING_LITERAL_SINGLE_QUOTE => [:object, :_objectList_1],
      "[" => [:object, :_objectList_1],
      "false" => [:object, :_objectList_1],
      "true" => [:object, :_objectList_1],
    },
    :predicate => {
      "(" => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [:iri],
      :PNAME_LN => [:iri],
      :PNAME_NS => [:iri],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "false" => [],
      "true" => [],
    },
    :predicateObjectList => {
      "." => [],
      :IRIREF => [:verb, :objectList, :_predicateObjectList_1],
      :PNAME_LN => [:verb, :objectList, :_predicateObjectList_1],
      :PNAME_NS => [:verb, :objectList, :_predicateObjectList_1],
      "]" => [],
      "a" => [:verb, :objectList, :_predicateObjectList_1],
    },
    :prefixID => {
      "(" => [],
      "@base" => [],
      "@prefix" => ["@prefix", :PNAME_NS, :IRIREF, "."],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :SPARQL_BASE => [],
      :SPARQL_PREFIX => [],
      "[" => [],
    },
    :sparqlBase => {
      "(" => [],
      "@base" => [],
      "@prefix" => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :SPARQL_BASE => [:SPARQL_BASE, :IRIREF],
      :SPARQL_PREFIX => [],
      "[" => [],
    },
    :sparqlPrefix => {
      "(" => [],
      "@base" => [],
      "@prefix" => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :IRIREF => [],
      :PNAME_LN => [],
      :PNAME_NS => [],
      :SPARQL_BASE => [],
      :SPARQL_PREFIX => [:SPARQL_PREFIX, :PNAME_NS, :IRIREF],
      "[" => [],
    },
    :statement => {
      "(" => [:_statement_1],
      "@base" => [:directive],
      "@prefix" => [:directive],
      :ANON => [:_statement_1],
      :BLANK_NODE_LABEL => [:_statement_1],
      :IRIREF => [:_statement_1],
      :PNAME_LN => [:_statement_1],
      :PNAME_NS => [:_statement_1],
      :SPARQL_BASE => [:directive],
      :SPARQL_PREFIX => [:directive],
      "[" => [:_statement_1],
    },
    :subject => {
      "(" => [:collection],
      :ANON => [:BlankNode],
      :BLANK_NODE_LABEL => [:BlankNode],
      :IRIREF => [:iri],
      :PNAME_LN => [:iri],
      :PNAME_NS => [:iri],
      "a" => [],
    },
    :triples => {
      "(" => [:_triples_1],
      "." => [],
      :ANON => [:_triples_1],
      :BLANK_NODE_LABEL => [:_triples_1],
      :IRIREF => [:_triples_1],
      :PNAME_LN => [:_triples_1],
      :PNAME_NS => [:_triples_1],
      "[" => [:_triples_2],
    },
    :turtleDoc => {
      "(" => [:_turtleDoc_1],
      "@base" => [:_turtleDoc_1],
      "@prefix" => [:_turtleDoc_1],
      :ANON => [:_turtleDoc_1],
      :BLANK_NODE_LABEL => [:_turtleDoc_1],
      :IRIREF => [:_turtleDoc_1],
      :PNAME_LN => [:_turtleDoc_1],
      :PNAME_NS => [:_turtleDoc_1],
      :SPARQL_BASE => [:_turtleDoc_1],
      :SPARQL_PREFIX => [:_turtleDoc_1],
      "[" => [:_turtleDoc_1],
      :_empty => [],
      :_eof => [],
    },
    :verb => {
      "(" => [],
      :ANON => [],
      :BLANK_NODE_LABEL => [],
      :DECIMAL => [],
      :DOUBLE => [],
      :INTEGER => [],
      :IRIREF => [:predicate],
      :PNAME_LN => [:predicate],
      :PNAME_NS => [:predicate],
      :STRING_LITERAL_LONG_QUOTE => [],
      :STRING_LITERAL_LONG_SINGLE_QUOTE => [],
      :STRING_LITERAL_QUOTE => [],
      :STRING_LITERAL_SINGLE_QUOTE => [],
      "[" => [],
      "a" => ["a"],
      "false" => [],
      "true" => [],
    },
  }.freeze
  TERMINALS = [
    "(",
    ")",
    ",",
    ".",
    ";",
    "@base",
    "@prefix",
    :ANON,
    :BLANK_NODE_LABEL,
    :DECIMAL,
    :DOUBLE,
    :INTEGER,
    :IRIREF,
    :LANGTAG,
    :PNAME_LN,
    :PNAME_NS,
    :SPARQL_BASE,
    :SPARQL_PREFIX,
    :STRING_LITERAL_LONG_QUOTE,
    :STRING_LITERAL_LONG_SINGLE_QUOTE,
    :STRING_LITERAL_QUOTE,
    :STRING_LITERAL_SINGLE_QUOTE,
    "[",
    "]",
    "^^",
    "a",
    "false",
    "true"
  ].freeze
  FIRST = {
    :BlankNode => [
      :BLANK_NODE_LABEL,
      :ANON],
    :BooleanLiteral => [
      "true",
      "false"],
    :NumericLiteral => [
      :INTEGER,
      :DECIMAL,
      :DOUBLE],
    :PrefixedName => [
      :PNAME_NS,
      :PNAME_LN],
    :RDFLiteral => [
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :String => [
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_RDFLiteral_1 => [
      :LANGTAG,
      "^^"],
    :_RDFLiteral_2 => [
      :LANGTAG,
      "^^"],
    :_RDFLiteral_3 => [
      "^^"],
    :_RDFLiteral_4 => [
      :LANGTAG,
      "^^"],
    :_base_1 => [
      :IRIREF],
    :_blankNodePropertyList_1 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_blankNodePropertyList_2 => [
      "]"],
    :_collection_1 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_2 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_3 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_4 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_5 => [
      ")"],
    :_empty => [
      ],
    :_objectList_1 => [
      ","],
    :_objectList_2 => [
      ","],
    :_objectList_3 => [
      ","],
    :_objectList_4 => [
      ","],
    :_objectList_5 => [
      ","],
    :_objectList_6 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_predicateObjectList_1 => [
      ";"],
    :_predicateObjectList_2 => [
      ";"],
    :_predicateObjectList_3 => [
      ";"],
    :_predicateObjectList_4 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_5 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_6 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_predicateObjectList_7 => [
      ";"],
    :_predicateObjectList_8 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_9 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_prefixID_1 => [
      :PNAME_NS],
    :_sparqlBase_1 => [
      :IRIREF],
    :_sparqlPrefix_1 => [
      :PNAME_NS],
    :_statement_1 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_statement_2 => [
      "."],
    :_triples_1 => [
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_2 => [
      "["],
    :_triples_3 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_4 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_5 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_turtleDoc_1 => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_turtleDoc_2 => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :base => [
      "@base"],
    :blankNodePropertyList => [
      "["],
    :collection => [
      "("],
    :directive => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE],
    :iri => [
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :literal => [
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :object => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :objectList => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :predicate => [
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :predicateObjectList => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :prefixID => [
      "@prefix"],
    :sparqlBase => [
      :SPARQL_BASE],
    :sparqlPrefix => [
      :SPARQL_PREFIX],
    :statement => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :subject => [
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :triples => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :turtleDoc => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :verb => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
  }.freeze
  FOLLOW = {
    :BlankNode => [
      :BLANK_NODE_LABEL,
      :ANON],
    :BooleanLiteral => [
      "true",
      "false"],
    :NumericLiteral => [
      :INTEGER,
      :DECIMAL,
      :DOUBLE],
    :PrefixedName => [
      :PNAME_NS,
      :PNAME_LN],
    :RDFLiteral => [
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :String => [
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_RDFLiteral_1 => [
      :LANGTAG,
      "^^"],
    :_RDFLiteral_2 => [
      :LANGTAG,
      "^^"],
    :_RDFLiteral_3 => [
      "^^"],
    :_RDFLiteral_4 => [
      :LANGTAG,
      "^^"],
    :_base_1 => [
      :IRIREF],
    :_blankNodePropertyList_1 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_blankNodePropertyList_2 => [
      "]"],
    :_collection_1 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_2 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_3 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_4 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_collection_5 => [
      ")"],
    :_empty => [
      ],
    :_objectList_1 => [
      ","],
    :_objectList_2 => [
      ","],
    :_objectList_3 => [
      ","],
    :_objectList_4 => [
      ","],
    :_objectList_5 => [
      ","],
    :_objectList_6 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_predicateObjectList_1 => [
      ";"],
    :_predicateObjectList_2 => [
      ";"],
    :_predicateObjectList_3 => [
      ";"],
    :_predicateObjectList_4 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_5 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_6 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_predicateObjectList_7 => [
      ";"],
    :_predicateObjectList_8 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_predicateObjectList_9 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :_prefixID_1 => [
      :PNAME_NS],
    :_sparqlBase_1 => [
      :IRIREF],
    :_sparqlPrefix_1 => [
      :PNAME_NS],
    :_statement_1 => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_statement_2 => [
      "."],
    :_triples_1 => [
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_2 => [
      "["],
    :_triples_3 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_4 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_triples_5 => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :_turtleDoc_1 => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :_turtleDoc_2 => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :base => [
      "@base"],
    :blankNodePropertyList => [
      "["],
    :collection => [
      "("],
    :directive => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE],
    :iri => [
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :literal => [
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :object => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :objectList => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :INTEGER,
      :DECIMAL,
      :DOUBLE,
      "true",
      "false",
      :PNAME_NS,
      :PNAME_LN,
      :STRING_LITERAL_QUOTE,
      :STRING_LITERAL_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_SINGLE_QUOTE,
      :STRING_LITERAL_LONG_QUOTE],
    :predicate => [
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :predicateObjectList => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
    :prefixID => [
      "@prefix"],
    :sparqlBase => [
      :SPARQL_BASE],
    :sparqlPrefix => [
      :SPARQL_PREFIX],
    :statement => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :subject => [
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :triples => [
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :turtleDoc => [
      "@prefix",
      "@base",
      :SPARQL_PREFIX,
      :SPARQL_BASE,
      "[",
      "(",
      :IRIREF,
      :BLANK_NODE_LABEL,
      :ANON,
      :PNAME_NS,
      :PNAME_LN],
    :verb => [
      "a",
      :IRIREF,
      :PNAME_NS,
      :PNAME_LN],
  }.freeze
end

