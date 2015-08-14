# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns the CQL MAP definition
    #
    # @example
    #   fn = Operators[:cql_map]
    #
    #   fn[:foo, :bar]
    #   # => "MAP<foo, bar>"
    #
    #   fn[:foo, cql_frozen(:bar)]
    #   # => "MAP<foo, FROZEN <bar>>"
    #
    # @param [Array<#to_s>] values
    #
    # @return [String]
    #
    def self.cql_map(*values)
      key, value = values.flatten
      "MAP<#{key}, #{value}>"
    end

  end # module Operators

end # module CQLBuilder
