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
      # @return [QueryBuilder::Statements::AlterKeyspace]
      #
      def with(options)
        options
          .map { |key, value| Clauses::With.new(column: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_with
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

    end # module With

  end # module Modifiers

end # module QueryBuilder::CQL
