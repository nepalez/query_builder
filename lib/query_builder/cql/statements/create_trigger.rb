# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TRIGGER' CQL3 statement
    #
    class CreateTrigger < Base

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Defines the keyspace for the trigger
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Defines the table for the trigger
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def on(name)
        self << Clauses::On.new(name: name)
      end

      # Defines java class for the trigger
      #
      # @param [#to_s] java_class
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def using(java_class)
        self << Clauses::Using.new(value: java_class)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TRIGGER", maybe_if, name.to_s, "ON", full_name, maybe_using]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

      def full_name
        table    = clauses(:on).last
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << table
      end

    end # class CreateTrigger

  end # module Statements

end # module QueryBuilder::CQL
