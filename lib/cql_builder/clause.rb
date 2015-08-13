# encoding: utf-8

module CQLBuilder

  # The base class for all AST clauses (parts of statement)
  #
  # Every clause has a type, allowing to filter clauses of a statement.
  #
  # @abstract
  #
  class Clause < Base

    # Gets/sets type for the specific clause class
    #
    # @param [#to_sym, nil] value
    #
    # @return [Symbol, nil]
    #
    def self.type(value = nil)
      value ? (@type = value) : @type
    end

    # @!method type
    #
    # @return [Symbol] The type of the clause
    #
    def type
      self.class.type
    end

  end # class Clause

  # The collection of concrete CQL clauses
  #
  module Clauses

    require_relative "clauses/if_exists"
    require_relative "clauses/if_not_exists"
    require_relative "clauses/condition"
    require_relative "clauses/with"

  end # module Clauses

end # module CQLBuilder
