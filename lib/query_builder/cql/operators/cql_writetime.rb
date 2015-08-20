# encoding: utf-8

module QueryBuilder::CQL::Operators

  # Describes WRITETIME() function
  #
  # @example
  #   fn = Operators[:cql_writetime]
  #   fn[:name]
  #   # => "WRITETIME(name)"
  #
  # @param [#to_s] column
  #
  # @return [String]
  #
  def self.cql_writetime(column)
    "WRITETIME(#{column})"
  end

end # module QueryBuilder::CQL::Operators
