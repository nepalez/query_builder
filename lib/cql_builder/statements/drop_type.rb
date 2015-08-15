# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP TYPE' CQL3 statement
    #
    class DropType < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::DropType]
      #
      def if_exists
        self << Clauses::IfExists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP TYPE", clauses(:if_exists), name.to_s]
      end

    end # class DropType

  end # module Statements

end # module CQLBuilder
