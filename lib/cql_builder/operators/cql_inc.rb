# encoding: utf-8

module CQLBuilder

  module Operators

    # Describes incrementing of the column
    #
    # @example
    #   fn = Operators[:cql_inc, 3]
    #   fn[:foo]
    #   # => "foo = foo + 3"
    #
    # @param [#to_s] column
    # @param [Numeric] value
    #
    # @return [String]
    #
    def self.cql_inc(column, value)
      "#{column} = #{column} + #{value}"
    end

  end # module Operators

end # module CQLBuilder
