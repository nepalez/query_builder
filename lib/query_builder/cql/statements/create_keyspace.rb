# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE KEYSPACE' CQL3 statement
    #
    class CreateKeyspace < Base

      include Modifiers::With

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateKeyspace]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE KEYSPACE", maybe_if, context.to_s, maybe_with]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class CreateKeyspace

  end # module Statements

end # module QueryBuilder::CQL
