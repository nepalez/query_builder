# encoding: utf-8

module QueryBuilder

  require_relative "cql/operators"
  require_relative "cql/clauses"
  require_relative "cql/contexts"
  require_relative "cql/modifiers"
  require_relative "cql/statements"

  # The builder for CQL-specific statements
  #
  module CQL

    # Returns the context of Cassandra keyspace
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @param [QueryBuilder::CQL::Contexts::Keyspace]
    #
    def self.keyspace(name)
      Contexts::Keyspace.new(name: name)
    end

    # Returns the context of Cassandra user
    #
    # @param [#to_s] name The name of the user
    #
    # @param [QueryBuilder::CQL::Contexts::User]
    #
    def self.user(name)
      Contexts::User.new(name: name)
    end

    # Returns the context of Cassandra users role
    #
    # @param [#to_s] name The name of the role
    #
    # @param [QueryBuilder::CQL::Contexts::Role]
    #
    def self.role(name)
      Contexts::Role.new(name: name)
    end

    # Builds the 'LIST USERS' CQL statement
    #
    # @return [QueryBuilder::Statements::ListUsers]
    #
    def self.users
      Statements::ListUsers.new
    end

    # Builds the 'LIST ROLES' CQL statement
    #
    # @return [QueryBuilder::Statements::ListRoles]
    #
    def self.roles
      Statements::ListRoles.new
    end

  end # module CQL

end # module QueryBuilder
