# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP INDEX' CQL3 statement
    #
    class DropIndex < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropIndex]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP INDEX", maybe_if, full_name]
      end

      private

      def full_name
        "#{context.table.keyspace.name}.#{context.name}"
      end

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropIndex

  end # module Statements

end # module QueryBuilder::CQL
