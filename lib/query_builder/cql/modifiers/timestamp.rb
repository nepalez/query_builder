# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides LIMIT clauses for statements
    #
    module Timestamp

      # Adds LIMIT clause to the statement
      #
      # @param [Integer] value
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def timestamp(value)
        self << Clause.new(value: value)
      end

      private

      def maybe_using
        list = clauses(:using)
        ["USING", list.sort.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :using

        attribute :value, required: true

        # @private
        def to_s
          "TIMESTAMP #{value}"
        end

      end # class Clause

    end # module Timestamp

  end # module Modifiers

end # module QueryBuilder::CQL
