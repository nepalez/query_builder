# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TYPE' CQL3 statement
    #
    class DropType < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TYPE", maybe_if, context.to_s]
      end

    end # class DropType

  end # module Statements

end # module QueryBuilder::CQL
