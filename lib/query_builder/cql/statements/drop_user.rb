# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP USER' CQL3 statement
    #
    class DropUser < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropUser]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP USER", maybe_if, name.to_s]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropUser

  end # module Statements

end # module QueryBuilder::CQL
