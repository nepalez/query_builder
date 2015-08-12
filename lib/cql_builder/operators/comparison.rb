# encoding: utf-8

module CQLBuilder

  module Operators

    # Describes comparison of column(key) to some value
    #
    # @example
    #   lte = Comparison.new(key: :foo, value: :bar, symbol: :<=)
    #   lte.to_cql
    #   # => "foo <= 'bar'"
    #
    class Comparison < Base

      attribute :value
      attribute :symbol

      # CQL chunk provided by the operator
      #
      # @param [#to_s] column The name of the column to compare
      #
      # @return [String]
      #
      def to_s(column)
        "#{column} #{symbol} #{quoted}"
      end

      private

      # @todo: extract to type converter
      def quoted
        value.is_a?(Numeric) ? value.to_s : "'#{value}'"
      end

    end # class Comparison

  end # module Operator

end # module CQLBuilder
