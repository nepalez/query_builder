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
      def field(name, type_name)
        self << Clauses::Column.new(name: name, type_name: type_name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TYPE", maybe_if, context.to_s, "(#{fields})"]
      end

      private

      def fields
        clauses(:column).join(", ")
      end

    end # class CreateType

  end # module Statements

end # module QueryBuilder::CQL
