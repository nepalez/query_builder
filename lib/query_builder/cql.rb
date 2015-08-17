# encoding: utf-8

module QueryBuilder

  require_relative "cql/operators"
  require_relative "cql/clauses"
  require_relative "cql/contexts"
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
    def self.list_users
      Statements::ListUsers.new
    end

    # Builds the 'LIST ROLES' CQL statement
    #
    # @return [QueryBuilder::Statements::ListRoles]
    #
    def self.list_roles
      Statements::ListRoles.new
    end

    # Builds the 'DROP ROLE' CQL statement
    #
    # @param [#to_s] name The name of the role
    #
    # @return [QueryBuilder::Statements::DropRole]
    #
    def self.drop_role(name)
      Statements::DropRole.new(name: name)
    end

    # Builds the 'DROP TABLE' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::DropTable]
    #
    def self.drop_table(name)
      Statements::DropTable.new(name: name)
    end

    # Builds the 'DROP TRIGGER' CQL statement
    #
    # @param [#to_s] name The name of the trigger
    #
    # @return [QueryBuilder::Statements::DropTrigger]
    #
    def self.drop_trigger(name)
      Statements::DropTrigger.new(name: name)
    end

    # Builds the 'DROP TYPE' CQL statement
    #
    # @param [#to_s] name The name of the type
    #
    # @return [QueryBuilder::Statements::DropType]
    #
    def self.drop_type(name)
      Statements::DropType.new(name: name)
    end

    # Builds the 'DROP USER' CQL statement
    #
    # @param [#to_s] name The name of the user
    #
    # @return [QueryBuilder::Statements::DropUser]
    #
    def self.drop_user(name)
      Statements::DropUser.new(name: name)
    end

    # Builds the 'INSERT' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Insert]
    #
    def self.insert_into(name)
      Statements::Insert.new(name: name)
    end

    # Builds the 'DROP TABLE' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Truncate]
    #
    def self.truncate(name)
      Statements::Truncate.new(name: name)
    end

    # Builds the 'UPDATE' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Update]
    #
    def self.update(name)
      Statements::Update.new(name: name)
    end

  end # module CQL

end # module QueryBuilder
