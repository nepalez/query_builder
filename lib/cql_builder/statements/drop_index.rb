# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP INDEX' CQL3 statement
    #
    class DropIndex < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::DropIndex]
      #
      def if_exists
        self << Clauses::IfExists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [CQLBuilder::Statements::DropIndex]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP INDEX", maybe_exists, full_name]
      end

      private

      def maybe_exists
        clauses(:if_exists)
      end

      def full_name
        [clauses(:use).last, name].compact.join(".")
      end

    end # class DropIndex

  end # module Statements

end # module CQLBuilder
