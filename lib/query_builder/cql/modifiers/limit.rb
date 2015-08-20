# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides LIMIT clauses for statements
    #
    module Limit

      # Adds LIMIT clause to the statement
      #
      # @param [Integer] value
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def limit(value)
        self << Clause.new(value: value)
      end

      private

      def maybe_limit
        clauses(:limit)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :limit

        attribute :value, required: true

        # @private
        def to_s
          "LIMIT #{value}"
        end

      end # class Clause

    end # module Limit

  end # module Modifiers

end # module QueryBuilder::CQL
