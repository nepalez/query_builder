# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TYPE' CQL3 statement
    #
    class DropType < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropType]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TYPE", maybe_if, name.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropType

  end # module Statements

end # module QueryBuilder::CQL
