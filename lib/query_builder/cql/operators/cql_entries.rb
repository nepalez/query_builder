# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Describes entries index
  #
  # @example
  #   fn = Operators[:cql_entries]
  #   fn[:foo]
  #   # => "ENTRIES(foo)"
  #
  # @param [#to_s] column
  #
  # @return [String]
  #
  def self.cql_entries(column)
    "ENTRIES(#{column})"
  end

end # module QueryBuilder::CQL::Operators
