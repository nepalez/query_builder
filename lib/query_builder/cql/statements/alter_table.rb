# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TABLE' CQL3 statement
    #
    class AlterTable < Base

      include Modifiers::Alter

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TABLE", context.to_s, maybe_with]
      end

    end # class AlterTable

  end # module Statements

end # module QueryBuilder::CQL
