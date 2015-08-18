# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE ROLE' CQL3 statement
    #
    class CreateRole < Base

      include Modifiers::IfNotExists
      include Modifiers::With

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE ROLE", maybe_if, context.to_s, maybe_with]
      end

    end # class CreateRole

  end # module Statements

end # module QueryBuilder::CQL
