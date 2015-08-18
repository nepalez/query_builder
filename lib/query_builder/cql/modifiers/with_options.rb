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
        self << Clause.new(column: :options, value: options)
      end

      private

      def maybe_with
        list = clauses(:with)
        ["WITH", list.last] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < BaseCondition

        type :with

      end # class Clause

    end # module WithOptions

  end # module Modifiers

end # module QueryBuilder::CQL
