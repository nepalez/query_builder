# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP KEYSPACE' CQL3 statement
    #
    class DropKeyspace < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropKeyspace]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP KEYSPACE", maybe_if, context.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropKeyspace

  end # module Statements

end # module QueryBuilder::CQL
