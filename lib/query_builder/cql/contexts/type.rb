# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra user-defined type
    #
    class Type < Base

      attribute :keyspace, required: true
      attribute :name, required: true

      # Returns the full name of the type
      #
      # @return [String]
      #
      def to_s
        [keyspace, name].join(".")
      end

      # Builds the 'CREATE TYPE' CQL statement for the current type
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def create
        Statements::CreateType.new(context: self)
      end

      # Builds the 'DROP TYPE' CQL statement
      #
      # @return [QueryBuilder::Statements::DropType]
      #
      def drop
        Statements::DropType.new(context: self)
      end

    end # class Type

  end # module Contexts

end # module QueryBuilder::CQL
