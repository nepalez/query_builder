# encoding: utf-8

require_relative "cql_literal"

module QueryBuilder::CQL::Operators

  # Describes 'greater than' operator
  #
  # @example
  #   fn = Operators[:cql_gte, 3]
  #   fn[:foo]
  #   # => "foo > 3"
  #
  # @param [#to_s] column
  # @param [Numeric] value
  #
  # @return [String]
  #
  def self.cql_gt(column, value)
    "#{column} > #{cql_literal(value)}"
  end

end # module QueryBuilder::CQL::Operators
