# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TRIGGER' CQL3 statement
    #
    class CreateTrigger < Base

      include Modifiers::IfNotExists
      include Modifiers::Using

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE TRIGGER", maybe_if, context.name.to_s,
          "ON", context.table.to_s, maybe_using
        ]
      end

    end # class CreateTrigger

  end # module Statements

end # module QueryBuilder::CQL
