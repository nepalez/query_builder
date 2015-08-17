# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP FUNCTION' CQL3 statement
    #
    class DropFunction < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropFunction]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP FUNCTION", maybe_if, context.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropFunction

  end # module Statements

end # module QueryBuilder::CQL
