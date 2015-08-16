# encoding: utf-8

require_relative "cql_literal"

module CQLBuilder

  module Operators

    # Returns IN condition
    #
    # @example
    #   fn = Operators[:cql_in]
    #   fn[:foo, :bar, :baz]
    #   # => "foo IN ('bar', 'baz')"
    #
    # @param [#to_s] column
    # @param [Array<#to_s>] values
    #
    # @return [String]
    #
    def self.cql_in(column, *values)
      "#{column} IN (#{values.map { |value| cql_literal(value) }.join(", ")})"
    end

  end # module Operators

end # module CQLBuilder
