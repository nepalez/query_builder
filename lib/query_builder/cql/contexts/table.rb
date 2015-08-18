# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra table
    #
    class Table < Base

      attribute :keyspace, required: true
      attribute :name, required: true

      # Returns the full name of the table
      #
      # @return [String]
      #
      def to_s
        [keyspace, name].join(".")
      end

      # Returns the index context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Index]
      #
      def index(name = nil)
        Index.new(table: self, name: name)
      end

      # Returns the trigger context
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::CQL::Contexts::Trigger]
      #
      def trigger(name)
        Trigger.new(table: self, name: name)
      end

      # Builds the 'CREATE TABLE' CQL statement for the current table
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def create
        Statements::CreateTable.new(context: self)
      end

      # Builds the 'DROP TABLE' CQL statement for the current table
      #
      # @return [QueryBuilder::Statements::DropTable]
      #
      def drop
        Statements::DropTable.new(context: self)
      end

      # Builds the 'INSERT' CQL statement for the current table
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def insert(options)
        Statements::Insert.new(context: self).insert(options)
      end

      # Builds the 'UPDATE' CQL statement for the current table
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def update(options)
        Statements::Update.new(context: self).update(options)
      end

      # Builds the 'DELETE' CQL statement
      #
      # @param [Array<#to_s>, #to_s, nil] columns
      #
      # @return [QueryBuilder::Statements::Delete]
      #
      def delete(*columns)
        Statements::Delete.new(context: self).delete(*columns)
      end

      # Builds the 'TRUNCATE' CQL statement
      #
      # @return [QueryBuilder::Statements::Truncate]
      #
      def truncate
        Statements::Truncate.new(context: self)
      end

    end # class Table

  end # module Contexts

end # module QueryBuilder::CQL
