# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE USER' CQL3 statement
    #
    class CreateUser < Base

      include Modifiers::IfNotExists
      include Modifiers::Superuser
      include Modifiers::Password

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE USER", maybe_if, context.to_s, maybe_with, maybe_superuser]
      end

    end # class CreateUser

  end # module Statements

end # module QueryBuilder::CQL
