# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides IF EXISTS clauses for statements
    #
    module IfExists

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # module IfExists

  end # module Modifiers

end # module QueryBuilder::CQL
