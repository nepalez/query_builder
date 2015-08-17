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
          .map { |key, value| Clauses::Where.new(column: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_where
        list = clauses(:where)
        ["WHERE", list.join(" AND ")] if list.any?
      end

    end # module Where

  end # module Modifiers

end # module QueryBuilder::CQL
