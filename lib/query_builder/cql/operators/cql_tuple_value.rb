# encoding: utf-8

require_relative "cql_literal"

module QueryBuilder::CQL::Operators

  # Returns value of CQL tuple
  #
  # @example
  #   fn = Operators[:cql_tuple_value]
  #
  #   fn[:tiger, 1]
  #   # => "('tiger', 1)"
  #
  # @param [Array<#to_s>] values
  #
  # @return [String]
  #
  def self.cql_tuple_value(*values)
    "(#{values.flatten.map { |value| cql_literal(value) }.join(", ")})"
  end

end # module QueryBuilder::CQL::Operators
