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

    require_relative "clauses/column"
    require_relative "clauses/if_exists"
    require_relative "clauses/condition"
    require_relative "clauses/superuser"
    require_relative "clauses/with"
    require_relative "clauses/with_password"
    require_relative "clauses/use"
    require_relative "clauses/primary_key"
    require_relative "clauses/compact_storage"
    require_relative "clauses/clustering_order"
    require_relative "clauses/on"

  end # module Clauses

end # module CQLBuilder
