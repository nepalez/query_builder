# encoding: utf-8

module CQLBuilder

  module Clauses

    # The abstract class for conditions like WITH, WHERE etc.
    #
    # @example
    #   Condition.new(column: :foo, value: 1).to_s     # => "'foo' = 1"
    #   Condition.new(column: :foo, value: gt(1)).to_s # => "'foo' > 1"
    #
    # @abstract
    #
    # @api private
    #
    class Condition < Clause

      include Operators

      attribute :column, required: true
      attribute :value,  required: true

      # The CQL chunk representing the condition
      #
      # @return [String]
      #
      def to_s
        return value[column] if value.respond_to?(:call)
        "#{quote[column]} = #{quote[value]}"
      end

    end # class Condition

  end # module Clauses

end # module CQLBuilder
