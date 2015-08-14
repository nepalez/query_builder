# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns the CQL set definition
    #
    # @example
    #   fn = Operators[:cql_set]
    #
    #   fn[:foo]
    #   # => "set<foo>"
    #
    # @param [#to_s] value
    #
    # @return [String]
    #
    def self.cql_set(value)
      "set<#{value}>"
    end

  end # module Operators

end # module CQLBuilder
