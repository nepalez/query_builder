# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP AGGREGATE' CQL3 statement
    #
    class DropAggregate < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP AGGREGATE", maybe_if, context.to_s]
      end

    end # class DropAggregate

  end # module Statements

end # module QueryBuilder::CQL
