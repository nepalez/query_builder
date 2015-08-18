# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER ROLE' CQL3 statement
    #
    class AlterRole < Base

      include Modifiers::Superuser
      include Modifiers::Password

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER ROLE", context.name, maybe_with, maybe_superuser]
      end

    end # class AlterRole

  end # module Statements

end # module QueryBuilder::CQL
