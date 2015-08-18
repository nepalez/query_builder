# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides COMPACT STORAGE clauses for statements
    #
    module CompactStorage

      # Adds COMPACT STORAGE clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def compact_storage
        self << Clause.new
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
      class Clause < Base

        unique
        type :with

        # @private
        def to_s
          "COMPACT STORAGE"
        end

      end # class Clause

    end # module CompactStorage

  end # module Modifiers

end # module QueryBuilder::CQL
