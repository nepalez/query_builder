# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra table index
    #
    class Permission < Base

      attribute :name
      attribute :keyspace
      attribute :table

      # Returns the name of the context for permission
      #
      # @return [String]
      #
      def to_s
        return "TABLE #{table}" if table
        return "KEYSPACE #{keyspace}" if keyspace
        "ALL KEYSPACES"
      end

      # Builds the 'LIST PERMISSIONS' CQL statement
      #
      # @param [#to_s] name The name of either a user or role
      #
      # @return [QueryBuilder::Statements::ListPermissions]
      #
      def of(name)
        Statements::ListPermissions.new(context: self, name: name)
      end

      # Builds the 'GRANT' CQL statement
      #
      # @param [#to_s] name The name of either a user or role
      #
      # @return [QueryBuilder::Statements::Grant]
      #
      def grant_to(name)
        Statements::Grant.new(context: self, name: name)
      end

      # Builds the 'REVOKE' CQL statement
      #
      # @param [#to_s] name The name of either a user or role
      #
      # @return [QueryBuilder::Statements::Revoke]
      #
      def revoke_from(name)
        Statements::Revoke.new(context: self, name: name)
      end

    end # class Permission

  end # module Contexts

end # module QueryBuilder::CQL
