# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TABLE' CQL3 statement
    #
    class DropTable < Base

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropTable]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TABLE", maybe_if, context.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropTable

  end # module Statements

end # module QueryBuilder::CQL
