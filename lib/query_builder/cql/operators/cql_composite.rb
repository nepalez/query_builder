# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Returns a description for the composite partition key
  #
  # @example
  #   fn = Operators[:cql_composite]
  #   fn[:foo, :bar, :baz]
  #   # => "(foo, bar, baz)"
  #
  # @param [Array<#to_s>] columns List of columns for the composite
  #
  # @return [String]
  #
  def self.cql_composite(*columns)
    "(#{columns.flatten.join(", ")})"
  end

end # module QueryBuilder::CQL::Operators
