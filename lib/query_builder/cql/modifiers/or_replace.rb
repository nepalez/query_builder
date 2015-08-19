# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides OR REPLACE clauses for statements
    #
    module OrReplace

      # Adds OR REPLACE clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def or_replace
        self << Clause.new
      end

      private

      def maybe_replace
        clauses(:replace)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :replace

        # @private
        def to_s
          "OR REPLACE"
        end

      end # class Clause

    end # module OrReplace

  end # module Modifiers

end # module QueryBuilder::CQL
