# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP KEYSPACE' CQL3 statement
    #
    class DropKeyspace < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP KEYSPACE", maybe_if, context.to_s]
      end

    end # class DropKeyspace

  end # module Statements

end # module QueryBuilder::CQL
