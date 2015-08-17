# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Describes full frozen collection index
  #
  # @example
  #   fn = Operators[:cql_full]
  #   fn[:foo]
  #   # => "FULL(foo)"
  #
  # @param [#to_s] column
  #
  # @return [String]
  #
  def self.cql_full(column)
    "FULL(#{column})"
  end

end # module QueryBuilder::CQL::Operators
