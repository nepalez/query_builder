# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'CREATE KEYSPACE' CQL3 statement
    #
    class CreateKeyspace < Statement

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::CreateKeyspace]
      #
      def if_not_exists
        self << Clauses::IfNotExists.new
      end

      # Adds WITH clause to the statement description
      #
      # @param [Hash] options
      #
      # @return [CQLBuilder::Statements::CreateKeyspace]
      #
      def with(options)
        options
          .map { |key, value| Clauses::With.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        ["CREATE KEYSPACE", if_not_exists_clause, quote[name], with_clauses]
          .compact
          .join(" ") << ";"
      end

      private

      def if_not_exists_clause
        clauses(:if_not_exists).first
      end

      def with_clauses
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

    end # class CreateKeyspace

  end # module Statements

end # module CQLBuilder
