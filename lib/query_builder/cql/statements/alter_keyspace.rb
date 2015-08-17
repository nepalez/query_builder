# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER KEYSPACE' CQL3 statement
    #
    class AlterKeyspace < Base

      include Modifiers::With

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER KEYSPACE", context.to_s, maybe_with]
      end

    end # class AlterKeyspace

  end # module Statements

end # module QueryBuilder::CQL
