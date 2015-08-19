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

      # Returns the field context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Field]
      #
      def field(name)
        Contexts::Field.new(type: self, name: name)
      end

      # Builds the 'CREATE TYPE' CQL statement
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
