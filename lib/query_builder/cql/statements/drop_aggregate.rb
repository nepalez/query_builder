# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP AGGREGATE' CQL3 statement
    #
    class DropAggregate < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropAggregate]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::DropAggregate]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP AGGREGATE", maybe_if, full_name]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

    end # class DropAggregate

  end # module Statements

end # module QueryBuilder::CQL
