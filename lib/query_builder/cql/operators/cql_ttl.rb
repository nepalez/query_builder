# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Describes TTL() function
  #
  # @example
  #   fn = Operators[:cql_ttl]
  #   fn[:name]
  #   # => "TTL(name)"
  #
  # @param [#to_s] column
  #
  # @return [String]
  #
  def self.cql_ttl(column)
    "TTL(#{column})"
  end

end # module QueryBuilder::CQL::Operators
