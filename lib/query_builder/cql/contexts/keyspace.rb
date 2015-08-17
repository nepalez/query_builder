# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra keyspace
    #
    class Keyspace < Base

      attribute :name, required: true

      # Returns the name of the keyspace
      #
      # @return [String]
      #
      def to_s
        name.to_s
      end

      # Returns the table context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Table]
      #
      def table(name)
        Table.new(keyspace: self, name: name)
      end

      # Returns the type context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Type]
      #
      def type(name)
        Type.new(keyspace: self, name: name)
      end

      # Returns the function context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Function]
      #
      def function(name)
        Function.new(keyspace: self, name: name)
      end

      # Returns the aggregate context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Aggregate]
      #
      def aggregate(name)
        Aggregate.new(keyspace: self, name: name)
      end

      # Builds the 'CREATE KEYSPACE' CQL statement for the current keyspace
      #
      # @return [QueryBuilder::Statements::CreateKeyspace]
      #
      def create
        Statements::CreateKeyspace.new(context: self)
      end

      # Builds the 'ALTER KEYSPACE' CQL statement for the current keyspace
      #
      # @return [QueryBuilder::CQL::Statements::AlterKeyspace]
      #
      def alter
        Statements::AlterKeyspace.new(context: self)
      end

      # Builds the 'DROP KEYSPACE' CQL statement for the current keyspace
      #
      # @return [QueryBuilder::CQL::Statements::DropKeyspace]
      #
      def drop
        Statements::DropKeyspace.new(context: self)
      end

      # Builds the 'USE' CQL statement
      #
      # @return [QueryBuilder::Statements::Use]
      #
      def use
        Statements::Use.new(context: self)
      end

    end # class Keyspace

  end # module Contexts

end # module QueryBuilder::CQL::Contexts
