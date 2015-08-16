# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'CREATE KEYSPACE' CQL3 statement
    #
    class CreateKeyspace < Statement

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::CreateKeyspace]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Adds WITH clause to the statement
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
        cql["CREATE KEYSPACE", maybe_if, name.to_s, maybe_with]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def maybe_with
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

    end # class CreateKeyspace

  end # module Statements

end # module CQLBuilder
