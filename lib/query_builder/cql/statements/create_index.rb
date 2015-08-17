# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE INDEX' CQL3 statement
    #
    class CreateIndex < Base

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
      end

      # Defines keyspace for the index
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Defines columns for the index
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def columns(*cols)
        cols.map { |col| Clauses::Field.new(name: col) }.inject(self, :<<)
      end

      # Defines the table for the index
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def on(name)
        self << Clauses::On.new(name: name)
      end

      # Defines java class for the index
      #
      # @param [#to_s] java_class
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def using(java_class)
        self << Clauses::Using.new(value: java_class)
      end

      # Adds WITH clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def with(options)
        self << Clauses::With.new(column: :options, value: options)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE", maybe_custom, "INDEX", maybe_if, maybe_name,
          "ON", full_name, maybe_columns, maybe_using, maybe_with
        ]
      end

      private

      def maybe_custom
        "CUSTOM" unless name
      end

      def maybe_name
        name.to_s if name
      end

      def maybe_columns
        "(#{clauses(:field).join(", ")})"
      end

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

      def maybe_with
        list = clauses(:with)
        list.any? ? ["WITH", list.last] : nil
      end

      def full_name
        table    = clauses(:on).last
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << table.to_s
      end

    end # class CreateIndex

  end # module Statements

end # module QueryBuilder::CQL
