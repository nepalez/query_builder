# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'DROP USER' CQL3 statement
    #
    class DropUser < Statement

      attribute :name, required: true

      # Adds IF EXISTS clause to the statement description
      #
      # @return [CQLBuilder::Statements::DropUser]
      #
      def if_exists
        self << Clauses::IfExists.new
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["DROP USER", clauses(:if_exists), quote[name]]
      end

    end # class DropUser

  end # module Statements

end # module CQLBuilder
