# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides ALLOW FILTERING clauses for statements
    #
    module AllowFiltering

      # Adds ALLOW FILTERING clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def allow_filtering
        self << Clause.new
      end

      private

      def maybe_filter
        clauses(:filter)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :filter

        # @private
        def to_s
          "ALLOW FILTERING"
        end

      end # class Clause

    end # module AllowFiltering

  end # module Modifiers

end # module QueryBuilder::CQL
