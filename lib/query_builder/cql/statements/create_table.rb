# encoding: utf-8

module QueryBuilder::CQL

  module Statements

      # Describes the 'CREATE TABLE' CQL3 statement
      #
      class CreateTable < Base

        attribute :name, required: true

        # Adds IF NOT EXISTS clause to the statement
        #
        # @return [QueryBuilder::Statements::CreateTable]
        #
        def if_not_exists
          self << Clauses::Exists.new(reverse: true)
        end

        # Defines keyspace for the table
        #
        # @param [#to_s] name
        #
        # @return [QueryBuilder::Statements::CreateTable]
        #
        def use(name)
          self << Clauses::Use.new(name: name)
        end

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

        # Adds WITH clause(s) to the statement
        #
        # @param [Hash] options
        #
        # @return [QueryBuilder::Statements::CreateTable]
        #
        def with(options)
          options
            .map { |key, value| Clauses::With.new(column: key, value: value) }
            .inject(self, :<<)
        end

        # Builds the statement
        #
        # @return [String]
        #
        def to_s
          cql["CREATE TABLE", maybe_if, full_name, "(#{columns})", maybe_with]
        end

        private

        def maybe_if
          list = clauses(:if)
          list.any? ? ["IF", list.sort.join(" AND ")] : nil
        end

        def full_name
          keyspace = clauses(:use).last
          (keyspace ? "#{keyspace}." : "") << name.to_s
        end

        def maybe_with
          list = clauses(:with)
          ["WITH", list.join(" AND ")] if list.any?
        end

        def columns
          (clauses(:column) + [clauses(:primary_key).last]).compact.join(", ")
        end

      end # class CreateTable

  end # module Statements

end # module QueryBuilder::CQL
