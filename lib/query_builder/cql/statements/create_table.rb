# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TABLE' CQL3 statement
    #
    class CreateTable < Base

      include Modifiers::With
      include Modifiers::IfNotExists

      # Defines a primary key for the table
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def primary_key(*columns)
        self << Clauses::PrimaryKey.new(columns: columns)
      end

      # Adds column to the table
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      # @param [Hash] options
      # @option options [Boolean] :static
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def column(name, type_name, options = {})
        self << Clauses::Column
          .new(name: name, type_name: type_name, static: options[:static])
      end

      # Adds CLUSTERNING ORDER clause to the statement
      #
      # @param [#to_s] name The name of the column
      # @param [:asc, :desc] order The order of clustering
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def clustering_order(name, order = :asc)
        self << Clauses::ClusteringOrder
          .new(name: name, desc: order.equal?(:desc))
      end

      # Adds COMPACT STORAGE clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def compact_storage
        self << Clauses::CompactStorage.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TABLE", maybe_if, context.to_s, "(#{columns})", maybe_with]
      end

      private

      def columns
        (clauses(:column) + [clauses(:primary_key).last]).compact.join(", ")
      end

    end # class CreateTable

  end # module Statements

end # module QueryBuilder::CQL
