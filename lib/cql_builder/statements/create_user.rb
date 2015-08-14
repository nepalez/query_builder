# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'CREATE USER' CQL3 statement
    #
    class CreateUser < Statement

      attribute :name, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::CreateUser]
      #
      def if_not_exists
        self << Clauses::IfNotExists.new
      end

      # Adds WITH PASSWORD clause to the statement
      #
      # @param [#to_s] password
      #
      # @return [CQLBuilder::Statements::CreateUser]
      #
      def with_password(password)
        self << Clauses::WithPassword.new(password: password)
      end

      # Adds SUPERUSER|NOSUPERUSER clause to the statement
      #
      # @param [Boolean] option (true)
      #
      # @return [CQLBuilder::Statements::CreateUser]
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
          clauses(:if_not_exists),
          identifier[name],
          clauses(:with_password).last,
          clauses(:superuser).last
        ]
      end

    end # class CreateUser

  end # module Statements

end # module CQLBuilder
