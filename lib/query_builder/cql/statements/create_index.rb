# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE INDEX' CQL3 statement
    #
    class CreateIndex < Base

      include Modifiers::IfNotExists

      # Defines columns for the index
      #
      # @param [#to_s, Array<#to_s>] cols
      #
      # @return [QueryBuilder::Statements::CreateIndex]
      #
      def columns(*cols)
        cols.map { |col| Clauses::Field.new(name: col) }.inject(self, :<<)
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
          "ON", context.table.to_s, maybe_columns, maybe_using, maybe_with
        ]
      end

      private

      def maybe_name
        context.name.to_s if context.name
      end

      def maybe_custom
        "CUSTOM" unless maybe_name
      end

      def maybe_columns
        "(#{clauses(:field).join(", ")})"
      end

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

      def maybe_with
        list = clauses(:with)
        list.any? ? ["WITH", list.last] : nil
      end

    end # class CreateIndex

  end # module Statements

end # module QueryBuilder::CQL
