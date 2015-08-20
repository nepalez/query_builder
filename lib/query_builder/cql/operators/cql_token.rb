# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Returns the CQL TOKEN() definition
  #
  # @example
  #   fn = Operators[:cql_token]
  #
  #   fn[:int]
  #   # => "TOKEN(int)"
  #
  # @param [#to_s] type
  #
  # @return [String]
  #
  def self.cql_token(type)
    "TOKEN(#{type})"
  end

end # module QueryBuilder::CQL::Operators
