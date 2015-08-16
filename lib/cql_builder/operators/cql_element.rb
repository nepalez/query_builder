# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns a description for element of CQL collection
    #
    # @example
    #   fn = Operators[:cql_element]
    #   fn[:foo, :bar]
    #   # => "foo['bar']"
    #
    # @param [#to_s] column
    # @param [#to_s] key
    #
    # @return [String]
    #
    def self.cql_element(column, key)
      "#{column}[#{cql_literal(key)}]"
    end

  end # module Operators

end # module CQLBuilder
