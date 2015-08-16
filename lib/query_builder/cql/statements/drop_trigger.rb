# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TRIGGER' CQL3 statement
    #
    class DropTrigger < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::DropTrigger]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Adds ON clause to the statement
      #
      # @param [#to_s] table The name of the table
      #
      # @return [QueryBuilder::Statements::DropTrigger]
      #
      def on(table)
        self << Clauses::On.new(name: table)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TRIGGER", maybe_if, name.to_s, maybe_on]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def maybe_on
        table = clauses(:on).last
        table ? "ON #{table}" : nil
      end

    end # class DropTrigger

  end # module Statements

end # module QueryBuilder::CQL
