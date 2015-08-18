# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER USER' CQL3 statement
    #
    class AlterUser < Base

      include Modifiers::Superuser

      attribute :password, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "ALTER USER", context.name,
          "WITH PASSWORD", cql_literal[password], maybe_superuser
        ]
      end

    end # class AlterUser

  end # module Statements

end # module QueryBuilder::CQL
