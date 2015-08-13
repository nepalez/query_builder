# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'ALTER KEYSPACE' CQL3 statement
    #
    class AlterKeyspace < Statement

      attribute :name, required: true

      # Adds WITH clause to the statement description
      #
      # @param [Hash] options
      #
      # @return [CQLBuilder::Statements::AlterKeyspace]
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
        ["ALTER KEYSPACE", quote[name], with_clauses].compact.join(" ") << ";"
      end

      private

      def with_clauses
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

    end # class AlterKeyspace

  end # module Statements

end # module CQLBuilder
