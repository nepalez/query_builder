# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'UPDATE' CQL3 statement
    #
    class Update < Base

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def if_exists
        self << Clauses::Exists.new
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Adds SET clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def set(options)
        options
          .map { |key, value| Clauses::Set.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Adds WHERE clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Update]
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
      # @return [QueryBuilder::Statements::Update]
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
      # @return [QueryBuilder::Statements::Update]
      #
      def using(options)
        options
          .map { |key, value| Clauses::Using.new(property: key, value: value) }
          .inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["UPDATE", full_name, maybe_using, maybe_set, maybe_where, maybe_if]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

      def maybe_set
        list = clauses(:set)
        ["SET", list.join(", ")] if list.any?
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

    end # class Update

  end # module Statements

end # module QueryBuilder::CQL
