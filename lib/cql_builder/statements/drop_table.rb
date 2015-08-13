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
        ["DROP TABLE", if_exists_clause, full_name].compact.join(" ") << ";"
      end

      private

      def keyspace
        clauses(:use).last
      end

      def full_name
        (keyspace ? "#{keyspace}." : "") << quote[name]
      end

      def if_exists_clause
        clauses(:if_exists).last
      end

    end # class DropTable

  end # module Statements

end # module CQLBuilder
