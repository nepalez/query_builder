# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TYPE' CQL3 statement
    #
    class CreateType < Base

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Defines keyspace for the type
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Adds field to the type
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def field(name, type_name)
        self << Clauses::Column.new(name: name, type_name: type_name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TYPE", maybe_if, full_name, "(#{fields})"]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

      def fields
        clauses(:column).join(", ")
      end

    end # class CreateType

  end # module Statements

end # module QueryBuilder::CQL
