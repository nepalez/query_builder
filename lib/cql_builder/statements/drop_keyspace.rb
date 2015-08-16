# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP KEYSPACE' CQL3 statement
    #
    class DropKeyspace < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::DropKeyspace]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP KEYSPACE", maybe_if, name.to_s]
      end

      private

      def maybe_if
        ifs = clauses(:if)
        ifs.any? ? ["IF", ifs.join(" AND ")] : nil
      end

    end # class DropKeyspace

  end # module Statements

end # module CQLBuilder
