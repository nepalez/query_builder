# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides IF EXISTS clauses for statements
    #
    module IfExists

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def if_exists
        self << Clauses::Exists.new
      end

      private

      def maybe_if
        list = clauses(:if)
        ["IF", list.sort.join(" AND ")] if list.any?
      end

    end # module IfExists

  end # module Modifiers

end # module QueryBuilder::CQL
