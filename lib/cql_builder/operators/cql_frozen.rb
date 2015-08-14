# encoding: utf-8

module CQLBuilder

  module Operators

    # Marks value as frozen
    #
    # @example
    #   fn = Operators[:cql_frozen]
    #   fn[:foo]
    #   # => "FROZEN <foo>"
    #
    # @param [#to_s] value
    #
    # @return [String]
    #
    def self.cql_frozen(value)
      "FROZEN <#{value}>"
    end

  end # module Operators

end # module CQLBuilder
