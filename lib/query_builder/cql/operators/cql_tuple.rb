# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Returns the CQL TUPLE definition
  #
  # @example
  #   fn = Operators[:cql_tuple]
  #
  #   fn[:int, :text]
  #   # => "TUPLE<int, text>"
  #
  # @param [Array<#to_s>] types
  #
  # @return [String]
  #
  def self.cql_tuple(*types)
    "TUPLE<#{types.flatten.join(", ")}>"
  end

end # module QueryBuilder::CQL::Operators
