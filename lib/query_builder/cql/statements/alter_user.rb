# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER USER' CQL3 statement
    #
    class AlterUser < Base

      attribute :password, required: true

      # Adds SUPERUSER|NOSUPERUSER clause to the statement
      #
      # @param [Boolean] option (true)
      #
      # @return [QueryBuilder::Statements::AlterUser]
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
          "ALTER USER",
          context.name,
          "WITH PASSWORD",
          cql_literal[password],
          maybe_superuser
        ]
      end

      private

      def maybe_superuser
        clauses(:superuser).last
      end

    end # class AlterUser

  end # module Statements

end # module QueryBuilder::CQL
