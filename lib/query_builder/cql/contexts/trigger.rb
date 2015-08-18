# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the user-defined trigger for the table
    #
    class Trigger < Base

      attribute :table, required: true
      attribute :name,  required: true

      # Returns the full name of the type
      #
      # @return [String]
      #
      def to_s
        [table.keyspace.name, name].join(".")
      end

      # Builds the 'CREATE TRIGGER' CQL statement for the current trigger
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def create
        Statements::CreateTrigger.new(context: self)
      end

      # Builds the 'DROP TRIGGER' CQL statement
      #
      # @return [QueryBuilder::Statements::DropTrigger]
      #
      def drop
        Statements::DropTrigger.new(context: self)
      end

    end # class Trigger

  end # module Contexts

end # module QueryBuilder::CQL
