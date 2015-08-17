# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides USING clauses for statements with various options
    #
    module UsingOptions

      # Adds USING clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def using(options)
        options
          .map { |key, value| Clauses::Using.new(property: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

    end # module UsingOptions

  end # module Modifiers

end # module QueryBuilder::CQL
