# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DROP TABLE' CQL3 statement
    #
    class DropTable < Base

      include Modifiers::IfExists

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TABLE", maybe_if, context.to_s]
      end

    end # class DropTable

  end # module Statements

end # module QueryBuilder::CQL
