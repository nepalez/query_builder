# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TYPE' CQL3 statement
    #
    class CreateType < Base

      include Modifiers::AddField
      include Modifiers::IfNotExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TYPE", maybe_if, context.to_s, maybe_fields]
      end

    end # class CreateType

  end # module Statements

end # module QueryBuilder::CQL
