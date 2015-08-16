# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DELETE' CQL3 statement
    #
    class Delete < Statement

      attribute :name, required: true

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Adds WHERE clause to the statement
      #
      # @param [Hash] options
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def where(options)
        options
          .map { |key, value| Clauses::Where.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Adds IF clause to the statement
      #
      # @param [Hash] options
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def if(options)
        options
          .map { |key, value| Clauses::If.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Adds USING clause to the statement
      #
      # @param [Hash] options
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def using(options)
        options
          .map { |key, value| Clauses::Using.new(property: key, value: value) }
          .inject(self, :<<)
      end

      # Adds IF EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Adds columns that should be deleted
      #
      # @return [CQLBuilder::Statements::Delete]
      #
      def values(*columns)
        columns.map { |name| Clauses::Value.new(name: name) }.inject(self, :<<)
      end
      alias_method :value, :values

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "DELETE",
          maybe_values,
          "FROM",
          full_name,
          maybe_using,
          maybe_where,
          maybe_if
        ]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

      def maybe_values
        list = clauses(:value)
        [list.join(", ")] if list.any?
      end

      def maybe_where
        list = clauses(:where)
        ["WHERE", list.join(" AND ")] if list.any?
      end

      def maybe_if
        list = clauses(:if)
        ["IF", list.sort.join(" AND ")] if list.any?
      end

      def maybe_using
        list = clauses(:using)
        ["USING", list.join(" AND ")] if list.any?
      end

    end # class Delete

  end # module Statements

end # module CQLBuilder
