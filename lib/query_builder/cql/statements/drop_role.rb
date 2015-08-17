# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP ROLE' CQL3 statement
    #
    class DropRole < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropRole]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP ROLE", maybe_if, name.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropRole

  end # module Statements

end # module QueryBuilder::CQL
