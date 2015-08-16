# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Returns the CQL LIST definition
  #
  # @example
  #   fn = Operators[:cql_list]
  #
  #   fn[:int]
  #   # => "LIST<int>"
  #
  # @param [#to_s] value
  #
  # @return [String]
  #
  def self.cql_list(value)
    "LIST<#{value}>"
  end

end # module QueryBuilder::CQL::Operators
