# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TABLE' CQL3 statement
    #
    class DropTable < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropTable]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::DropTable]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TABLE", maybe_if, full_name]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

    end # class DropTable

  end # module Statements

end # module QueryBuilder::CQL
