# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns the CQL SET definition
    #
    # @example
    #   fn = Operators[:cql_set]
    #
    #   fn[:foo]
    #   # => "SET<foo>"
    #
    # @param [#to_s] value
    #
    # @return [String]
    #
    def self.cql_set(value)
      "SET<#{value}>"
    end

  end # module Operators

end # module CQLBuilder
