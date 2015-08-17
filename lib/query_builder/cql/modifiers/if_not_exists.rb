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
        self << Clauses::Exists.new(reverse: true)
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # module IfNotExists

  end # module Modifiers

end # module QueryBuilder::CQL
