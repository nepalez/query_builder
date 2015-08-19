# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides NORECURSIVE clauses for statements
    #
    module Norecursive

      # Adds NORECURSIVE clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def norecursive
        self << Clause.new
      end

      private

      def maybe_norecursive
        clauses(:norecursive)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :norecursive

        # @private
        def to_s
          "NORECURSIVE"
        end

      end # class Clause

    end # module Norecursive

  end # module Modifiers

end # module QueryBuilder::CQL
