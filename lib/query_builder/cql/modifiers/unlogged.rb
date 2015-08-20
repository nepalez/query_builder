# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides UNLOGGED batch type
    #
    module Unlogged

      # Adds a clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def unlogged
        self << Clause.new
      end

      private

      def maybe_type
        clauses(:type)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :type

        # @private
        def to_s
          "UNLOGGED"
        end

      end # class Clause

    end # module Unlogged

  end # module Modifiers

end # module QueryBuilder::CQL
