# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra table index
    #
    class Index < Base

      attribute :table, required: true
      attribute :name

      # <description>
      #
      # @return [<type>] <description>
      #
      def to_s
        [table.keyspace.name, name].join(".")
      end

      # Builds the 'CREATE INDEX' CQL statement for the current table
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def create(options)
        Statements::CreateIndex.new(context: self).columns(options)
      end

      # Builds the 'DROP INDEX' CQL statement
      #
      # @return [QueryBuilder::Statements::DropIndex]
      #
      def drop
        Statements::DropIndex.new(context: self)
      end

    end # class Index

  end # module Contexts

end # module QueryBuilder::CQL
