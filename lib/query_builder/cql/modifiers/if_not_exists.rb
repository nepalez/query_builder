# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides IF NOT EXISTS clauses for statements
    #
    module IfNotExists

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def if_not_exists
        self << Clause.new
      end

      private

      def maybe_if
        list = clauses(:if)
        ["IF", list.sort.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :if

        # @private
        def to_s
          "NOT EXISTS"
        end

      end # class Clause

    end # module IfNotExists

  end # module Modifiers

end # module QueryBuilder::CQL
