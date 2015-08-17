# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TRIGGER' CQL3 statement
    #
    class DropTrigger < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropTrigger]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "DROP TRIGGER", maybe_if, context.name.to_s, "ON", context.table.to_s
        ]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropTrigger

  end # module Statements

end # module QueryBuilder::CQL
