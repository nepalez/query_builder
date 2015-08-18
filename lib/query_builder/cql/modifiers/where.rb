# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides WHERE clauses for statements
    #
    module Where

      # Adds WHERE clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def where(options)
        options
          .map { |key, value| Clause.new(column: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_where
        list = clauses(:where)
        ["WHERE", list.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < BaseCondition

        type :where

      end # class Clause

    end # module Where

  end # module Modifiers

end # module QueryBuilder::CQL
