# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP TABLE' CQL3 statement
    #
    class DropTable < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::DropTable]
      #
      def if_exists
        self << Clauses::IfExists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [CQLBuilder::Statements::DropTable]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TABLE", clauses(:if_exists), full_name]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << identifier[name]
      end

    end # class DropTable

  end # module Statements

end # module CQLBuilder
