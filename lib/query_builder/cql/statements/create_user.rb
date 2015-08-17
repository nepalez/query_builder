# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE USER' CQL3 statement
    #
    class CreateUser < Base

      include Modifiers::IfNotExists

      attribute :password, required: true

      # Adds SUPERUSER|NOSUPERUSER clause to the statement
      #
      # @param [Boolean] option (true)
      #
      # @return [QueryBuilder::Statements::CreateUser]
      #
      def superuser(option = true)
        self << Clauses::Superuser.new(reverse: !option)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE USER",
          maybe_if,
          context.name.to_s,
          "WITH PASSWORD",
          cql_literal[password],
          maybe_superuser
        ]
      end

      private

      def maybe_superuser
        clauses(:superuser).last
      end

    end # class CreateUser

  end # module Statements

end # module QueryBuilder::CQL
