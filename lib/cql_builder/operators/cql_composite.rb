# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns a description for the composite partition key
    #
    # @example
    #   fn = Operators[:cql_composite]
    #   fn[:foo, :bar, :baz]
    #   # => "(foo, bar, baz)"
    #
    # @param [#to_s] value
    #
    # @return [String]
    #
    def self.cql_composite(*values)
      "(#{values.flatten.join(", ")})"
    end

  end # module Operators

end # module CQLBuilder
