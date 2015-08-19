# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra user-defined function
    #
    class Function < Base

      attribute :keyspace, required: true
      attribute :name, required: true

      # Returns the full name of the function
      #
      # @return [String]
      #
      def to_s
        [keyspace, name].join(".")
      end

      # Builds the 'CREATE FUNCTION' CQL statement
      #
      # @param [#to_s] language
      # @param [#to_s] body
      #
      # @return [QueryBuilder::Statements::CreateFunction]
      #
      def create(language, body)
        Statements::CreateFunction
          .new(context: self, language: language, body: body)
      end

      # Builds the 'DROP FUNCTION' CQL statement
      #
      # @return [QueryBuilder::Statements::DropFunction]
      #
      def drop
        Statements::DropFunction.new(context: self)
      end

    end # class Function

  end # module Contexts

end # module QueryBuilder::CQL
