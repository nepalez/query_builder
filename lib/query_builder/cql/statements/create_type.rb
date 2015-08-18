# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TYPE' CQL3 statement
    #
    class CreateType < Base

      include Modifiers::IfNotExists

      # Adds field to the type
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      #
      # @return [QueryBuilder::Statements::CreateType]
      #
      def add(options)
        options
          .map { |key, value| Clauses::Column.new(name: key, type_name: value) }
          .inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TYPE", maybe_if, context.to_s, maybe_fields]
      end

      private

      def maybe_fields
        "(#{clauses(:column).join(", ")})"
      end

    end # class CreateType

  end # module Statements

end # module QueryBuilder::CQL
