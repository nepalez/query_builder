# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Returns the CQL MAP definition
  #
  # @example
  #   fn = Operators[:cql_map]
  #
  #   fn[:foo, :bar]
  #   # => "MAP<foo, bar>"
  #
  #   fn[:foo, cql_frozen(:bar)]
  #   # => "MAP<foo, FROZEN <bar>>"
  #
  # @param [Array<#to_s>] values
  #
  # @return [String]
  #
  def self.cql_map(*values)
    key, value = values.flatten
    "MAP<#{key}, #{value}>"
  end

end # module QueryBuilder::CQL::Operators
