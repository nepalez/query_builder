# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP KEYSPACE' CQL3 statement
    #
    class DropKeyspace < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::DropKeyspace]
      #
      def if_exists
        self << Clauses::IfExists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        ["DROP KEYSPACE", if_exists_clause, quote[name]]
          .compact
          .join(" ") << ";"
      end

      private

      def if_exists_clause
        clauses(:if_exists).first
      end

    end # class DropKeyspace

  end # module Statements

end # module CQLBuilder
