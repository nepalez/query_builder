# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TABLE' CQL3 statement
    #
    class CreateTable < Base

      include Modifiers::Column
      include Modifiers::PrimaryKey
      include Modifiers::IfNotExists
      include Modifiers::ClusteringOrder
      include Modifiers::CompactStorage
      include Modifiers::With

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TABLE", maybe_if, context.to_s, maybe_columns, maybe_with]
      end

    end # class CreateTable

  end # module Statements

end # module QueryBuilder::CQL
