# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides IF clauses for statements
    #
    module If

      # Adds IF clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def if(options)
        options
          .map { |key, value| Clause.new(column: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_if
        list = clauses(:if)
        ["IF", list.sort.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < BaseCondition

        type :if

      end # class Clause

    end # module If

  end # module Modifiers

end # module QueryBuilder::CQL
