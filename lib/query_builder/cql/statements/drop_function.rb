# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP FUNCTION' CQL3 statement
    #
    class DropFunction < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropFunction]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::DropFunction]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP FUNCTION", maybe_if, full_name]
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

    end # class DropFunction

  end # module Statements

end # module QueryBuilder::CQL
