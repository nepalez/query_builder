# encoding: utf-8

require_relative "cql_literal"

module QueryBuilder::CQL::Operators

  # Returns value of CQL TOKEN
  #
  # @example
  #   fn = Operators[:cql_token_value]
  #
  #   fn[:tiger]
  #   # => "TOKEN('tiger')"
  #
  # @param [#to_s] value
  #
  # @return [String]
  #
  def self.cql_token_value(value)
    "TOKEN(#{cql_literal(value)})"
  end

end # module QueryBuilder::CQL::Operators
