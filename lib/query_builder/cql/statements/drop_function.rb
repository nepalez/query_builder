# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP FUNCTION' CQL3 statement
    #
    class DropFunction < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP FUNCTION", maybe_if, context.to_s]
      end

    end # class DropFunction

  end # module Statements

end # module QueryBuilder::CQL
