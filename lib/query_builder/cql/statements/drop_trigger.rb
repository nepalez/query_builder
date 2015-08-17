# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TRIGGER' CQL3 statement
    #
    class DropTrigger < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "DROP TRIGGER", maybe_if, context.name.to_s, "ON", context.table.to_s
        ]
      end

    end # class DropTrigger

  end # module Statements

end # module QueryBuilder::CQL
