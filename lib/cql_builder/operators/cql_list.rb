# encoding: utf-8

module CQLBuilder

  module Operators

    # Returns the CQL list definition
    #
    # @example
    #   fn = Operators[:cql_list]
    #
    #   fn[:int]
    #   # => "list<int>"
    #
    # @param [#to_s] value
    #
    # @return [String]
    #
    def self.cql_list(value)
      "list<#{value}>"
    end

  end # module Operators

end # module CQLBuilder
