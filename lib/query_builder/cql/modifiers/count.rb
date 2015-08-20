# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides COUNT(*|1) clause to SELECT statement
    #
    module Count

      # Adds COUNT clause to the statement
      #
      # @param [Integer] value
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def count(value = nil)
        self << Clause.new(value: value)
      end

      private

      def maybe_selected
        list = clauses(:selected)
        list.any? ? list.join(", ") : "*"
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :selected
        attribute :value

        def to_s
          "COUNT(#{value ? value : "*"})"
        end

      end # class Clause

    end # module Count

  end # module Modifiers

end # module QueryBuilder::CQL
