# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'CREATE USER' CQL3 statement
    #
    class CreateUser < Statement

      attribute :name, required: true
      attribute :password, required: true

      # Adds IF NOT EXISTS clause to the statement
      #
      # @return [CQLBuilder::Statements::CreateUser]
      #
      def if_not_exists
        self << Clauses::Exists.new(reverse: true)
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
          maybe_if,
          name.to_s,
          "WITH PASSWORD",
          cql_literal[password],
          maybe_superuser
        ]
      end

      private

      def maybe_if
        list = clauses(:if)
        list.any? ? ["IF", list.sort.join(" AND ")] : nil
      end

      def maybe_superuser
        clauses(:superuser).last
      end

    end # class CreateUser

  end # module Statements

end # module CQLBuilder
