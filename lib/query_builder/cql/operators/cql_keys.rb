# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Describes keys index
  #
  # @example
  #   fn = Operators[:cql_keys]
  #   fn[:foo]
  #   # => "KEYS(foo)"
  #
  # @param [#to_s] column
  #
  # @return [String]
  #
  def self.cql_keys(column)
    "KEYS(#{column})"
  end

end # module QueryBuilder::CQL::Operators
