# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'TRUNCATE' CQL3 statement
    #
    class Truncate < Base

      attribute :name, required: true

      # Defines keyspace for the table
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::Truncate]
      #
      def use(name)
        self << Clauses::Use.new(name: name)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["TRUNCATE", full_name]
      end

      private

      def full_name
        keyspace = clauses(:use).last
        (keyspace ? "#{keyspace}." : "") << name.to_s
      end

    end # class Truncate

  end # module Statements

end # module QueryBuilder::CQL
