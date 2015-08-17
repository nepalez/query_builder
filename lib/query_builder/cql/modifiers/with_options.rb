# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides WITH OPTIONS clauses for statements
    #
    module WithOptions

      # Adds WITH OPTIONS clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def with(options)
        self << Clauses::With.new(column: :options, value: options)
      end

      private

      def maybe_with
        list = clauses(:with)
        list.any? ? ["WITH", list.last] : nil
      end

    end # module WithOptions

  end # module Modifiers

end # module QueryBuilder::CQL
