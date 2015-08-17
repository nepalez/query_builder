# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE KEYSPACE' CQL3 statement
    #
    class CreateKeyspace < Base

      include Modifiers::With
      include Modifiers::IfNotExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE KEYSPACE", maybe_if, context.to_s, maybe_with]
      end

    end # class CreateKeyspace

  end # module Statements

end # module QueryBuilder::CQL
