# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DELETE' CQL3 statement
    #
    class Delete < Base

      include Modifiers::Where
      include Modifiers::IfExists

      # Adds IF clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Delete]
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
      # @return [QueryBuilder::Statements::Delete]
      #
      def using(options)
        options
          .map { |key, value| Clauses::Using.new(property: key, value: value) }
          .inject(self, :<<)
      end

      # Adds columns that should be deleted
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Statements::Delete]
      #
      # @alias value
      #
      def values(*columns)
        columns.map { |name| Clauses::Field.new(name: name) }.inject(self, :<<)
      end
      alias_method :value, :values

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "DELETE", maybe_fields, "FROM", context.to_s,
          maybe_using, maybe_where, maybe_if
        ]
      end

      private

      def maybe_fields
        list = clauses(:field)
        [list.join(", ")] if list.any?
      end

      def maybe_using
        list = clauses(:using)
        ["USING", list.join(" AND ")] if list.any?
      end

    end # class Delete

  end # module Statements

end # module QueryBuilder::CQL
