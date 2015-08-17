# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra user
    #
    class User < Base

      attribute :name, required: true

      # Returns the full name of the type
      #
      # @return [String]
      #
      def to_s
        name.to_s
      end

      # Builds the 'ALTER USER' CQL statement with password
      #
      # @param [#to_s] password
      #
      # @return [QueryBuilder::Statements::AlterUser]
      #
      def alter(password)
        Statements::AlterUser.new(context: self, password: password)
      end

      # Builds the 'CREATE USER' CQL statement with password
      #
      # @param [#to_s] password
      #
      # @return [QueryBuilder::Statements::CreateUser]
      #
      def create(password)
        Statements::CreateUser.new(context: self, password: password)
      end

      # Builds the 'DROP USER' CQL statement
      #
      # @return [QueryBuilder::Statements::DropUser]
      #
      def drop
        Statements::DropUser.new(context: self)
      end

    end # class User

  end # module Contexts

end # module QueryBuilder::CQL::Contexts
