# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides WITH clauses for statements
    #
    module With

      # Adds WITH clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def with(options)
        options
          .map { |key, value| Clause.new(column: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_with
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < BaseCondition

        type :with

      end # class Clause

    end # module With

  end # module Modifiers

end # module QueryBuilder::CQL
