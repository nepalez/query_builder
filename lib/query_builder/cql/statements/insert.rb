# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'INSERT' CQL3 statement
    #
    class Insert < Base

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Adds USING clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def using(options)
        options
          .map { |key, value| Clauses::Using.new(property: key, value: value) }
          .inject(self, :<<)
      end

      # Defines value to be inserted
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def set(options)
        options.flat_map do |key, value|
          [Clauses::Field.new(name: key), Clauses::Value.new(name: value)]
        end.inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "INSERT INTO", full_name, maybe_columns, "VALUES", maybe_values,
          maybe_using, maybe_if
        ]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

      def maybe_if
        list = clauses(:if)
        ["IF", list.sort.join(" AND ")] if list.any?
      end

      def maybe_using
        list = clauses(:using)
        ["USING", list.join(" AND ")] if list.any?
      end

      def maybe_columns
        "(#{clauses(:field).join(", ")})"
      end

      def maybe_values
        "(#{clauses(:value).join(", ")})"
      end

    end # class Insert

  end # module Statements

end # module QueryBuilder::CQL
