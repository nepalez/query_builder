# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # The abstract class for conditions like WITH, WHERE etc.
  #
  # @example
  #   Condition.new(column: :foo, value: :bar).to_s  # => "foo = 'bar'"
  #   Condition.new(column: :foo, value: gt(1)).to_s # => "foo > 1"
  #
  # @abstract
  #
  # @api private
  #
  class Condition < Base

    attribute :column, required: true
    attribute :value,  required: true

    # The CQL chunk representing the condition
    #
    # @return [String]
    #
    def to_s
      return operator  if value.respond_to?(:call)
      return inclusion if value.instance_of? Array
      equality
    end

    private

    def equality
      "#{column} = #{cql_literal[value]}"
    end

    def inclusion
      cql_in[column, *value]
    end

    def operator
      value[column]
    end

  end # class Condition

end # module QueryBuilder::CQL::Clauses
