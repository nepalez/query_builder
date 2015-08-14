# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns the CQL map definition
    #
    # @example
    #   fn = Operators[:cql_map]
    #
    #   fn[:foo, :bar]
    #   # => "map<foo, bar>"
    #
    #   fn[:foo, frozen(:bar)]
    #   # => "map<foo, FROZEN <bar>>"
    #
    # @param [Array<#to_s>] values
    #
    # @return [String]
    #
    def self.cql_map(*values)
      key, value = values.flatten
      "map<#{key}, #{value}>"
    end

  end # module Operators

end # module CQLBuilder
