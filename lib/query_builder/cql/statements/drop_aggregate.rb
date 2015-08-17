# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP AGGREGATE' CQL3 statement
    #
    class DropAggregate < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropAggregate]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP AGGREGATE", maybe_if, context.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropAggregate

  end # module Statements

end # module QueryBuilder::CQL
