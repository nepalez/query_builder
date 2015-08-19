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

      # Builds the 'CREATE TYPE' CQL statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def create
        Statements::CreateType.new(context: self)
      end

      # Builds the 'ALTER TYPE ... ADD' CQL statement
      #
      # @param [#to_s] name
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Statements::UpdateType]
      #
      def add(name, type)
        Statements::UpdateType.new(context: self, name: name, type: type)
      end

      # Builds the 'ALTER TYPE ... ALTER' CQL statement
      #
      # @param [#to_s] name
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Statements::AlterType]
      #
      def alter(name, type)
        Statements::AlterType.new(context: self, name: name, type: type)
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
