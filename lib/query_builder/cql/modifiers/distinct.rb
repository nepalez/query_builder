# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides DISTINCT clauses for statements
    #
    module Distinct

      # Adds DISTINCT clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def distinct
        self << Clause.new
      end

      private

      def maybe_distinct
        clauses(:distinct)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :distinct

        # @private
        def to_s
          "DISTINCT"
        end

      end # class Clause

    end # module Distinct

  end # module Modifiers

end # module QueryBuilder::CQL
