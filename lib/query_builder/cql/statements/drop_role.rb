# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP ROLE' CQL3 statement
    #
    class DropRole < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP ROLE", maybe_if, context.to_s]
      end

    end # class DropRole

  end # module Statements

end # module QueryBuilder::CQL
