# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra table index
    #
    class Index < Base

      attribute :table, required: true
      attribute :name

      # Builds the 'CREATE INDEX' CQL statement for the current table
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def create
        Statements::CreateIndex.new(context: self)
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
