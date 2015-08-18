# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE USER' CQL3 statement
    #
    class CreateUser < Base

      include Modifiers::IfNotExists
      include Modifiers::Superuser

      attribute :password, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE USER", maybe_if, context.name.to_s,
          "WITH PASSWORD", cql_literal[password], maybe_superuser
        ]
      end

    end # class CreateUser

  end # module Statements

end # module QueryBuilder::CQL
