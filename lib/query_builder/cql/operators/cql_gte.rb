# encoding: utf-8

require_relative "cql_literal"

module QueryBuilder::CQL::Operators

  # Describes 'greater than or equal' operator
  #
  # @example
  #   fn = Operators[:cql_gt, 3]
  #   fn[:foo]
  #   # => "foo >= 3"
  #
  # It also support nested CQL function calls
  #
  # @example
  #   cql_fn = Operators[:cql_mintimeuuid, "2021-03-25 00:00:00 +0000"]
  #   fn = Operators[:cql_gte, cql_fn]
  #   fn[:foo]
  #   # => "foo >= MINTIMEUUID('2021-03-25 00:00:00')"
  #
  # @param [#to_s] column
  # @param [Transproc::Function, Numeric] argument
  #
  # @return [String]
  #
  def self.cql_gte(column, argument)
    "#{column} >= #{argument.instance_of?(Transproc::Function) ? argument.call : cql_literal(argument)}"
  end

end # module QueryBuilder::CQL::Operators
