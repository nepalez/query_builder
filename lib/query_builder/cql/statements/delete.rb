# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DELETE' CQL3 statement
    #
    class Delete < Base

      include Modifiers::Where
      include Modifiers::If
      include Modifiers::IfExists
      include Modifiers::UsingOptions

      # Adds columns that should be deleted
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Statements::Delete]
      #
      # @alias value
      #
      def delete(*columns)
        columns.map { |name| Clauses::Field.new(name: name) }.inject(self, :<<)
      end

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

    end # class Delete

  end # module Statements

end # module QueryBuilder::CQL
