# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP USER' CQL3 statement
    #
    class DropUser < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP USER", maybe_if, context.to_s]
      end

    end # class DropUser

  end # module Statements

end # module QueryBuilder::CQL
