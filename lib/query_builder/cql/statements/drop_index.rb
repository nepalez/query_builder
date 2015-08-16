# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP INDEX' CQL3 statement
    #
    class DropIndex < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropIndex]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::DropIndex]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP INDEX", maybe_if, full_name]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def full_name
        [clauses(:use).last, name].compact.join(".")
      end

    end # class DropIndex

  end # module Statements

end # module QueryBuilder::CQL
