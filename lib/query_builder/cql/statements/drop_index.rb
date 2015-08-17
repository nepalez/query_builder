# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP INDEX' CQL3 statement
    #
    class DropIndex < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP INDEX", maybe_if, full_name]
      end

      private

      def full_name
        "#{context.table.keyspace.name}.#{context.name}"
      end

    end # class DropIndex

  end # module Statements

end # module QueryBuilder::CQL
