# encoding: utf-8

module QueryBuilder

  require_relative "cql/operators"
  require_relative "cql/clauses"
  require_relative "cql/statements"

  # The builder for CQL-specific statements
  #
  module CQL

    # Builds the 'ALTER KEYSPACE' CQL statement
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::AlterKeyspace]
    #
    def self.alter_keyspace(name)
      Statements::AlterKeyspace.new(name: name)
    end

    # Builds the 'ALTER USER' CQL statement with name and password
    #
    # @param [#to_s] name
    # @param [#to_s] password
    #
    # @return [QueryBuilder::Statements::AlterUser]
    #
    def self.alter_user(name, password)
      Statements::AlterUser.new(name: name, password: password)
    end

    # Builds the 'CREATE KEYSPACE' CQL statement
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::CreateKeyspace]
    #
    def self.create_keyspace(name)
      Statements::CreateKeyspace.new(name: name)
    end

    # Builds the 'CREATE TABLE' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::CreateTable]
    #
    def self.create_table(name)
      Statements::CreateTable.new(name: name)
    end

    # Builds the 'CREATE TYPE' CQL statement
    #
    # @param [#to_s] name The name of the type
    #
    # @return [QueryBuilder::Statements::CreateType]
    #
    def self.create_type(name)
      Statements::CreateType.new(name: name)
    end

    # Builds the 'CREATE USER' CQL statement with name and password
    #
    # @param [#to_s] name
    # @param [#to_s] password
    #
    # @return [QueryBuilder::Statements::CreateUser]
    #
    def self.create_user(name, password)
      Statements::CreateUser.new(name: name, password: password)
    end

    # Builds the 'DELETE' CQL statement
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Delete]
    #
    def self.delete_from(name)
      Statements::Delete.new(name: name)
    end

    # Builds the 'DROP AGGREGATE' CQL statement
    #
    # @param [#to_s] name The name of the user defined aggregate
    #
    # @return [QueryBuilder::Statements::DropAggregate]
    #
    def self.drop_aggregate(name)
      Statements::DropAggregate.new(name: name)
    end

    # Builds the 'DROP FUNCTION' CQL statement
    #
    # @param [#to_s] name The name of the function
    #
    # @return [QueryBuilder::Statements::DropFunction]
    #
    def self.drop_function(name)
      Statements::DropFunction.new(name: name)
    end

    # Builds the 'DROP INDEX' CQL statement
    #
    # @param [#to_s] name The name of the index
    #
    # @return [QueryBuilder::Statements::DropIndex]
    #
    def self.drop_index(name)
      Statements::DropIndex.new(name: name)
    end

    # Builds the 'DROP KEYSPACE' CQL statement
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::DropKeyspace]
    #
    def self.drop_keyspace(name)
      Statements::DropKeyspace.new(name: name)
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

    # Builds the 'LIST USERS' CQL statement
    #
    # @return [QueryBuilder::Statements::ListUsers]
    #
    def self.list_users
      Statements::ListUsers.new
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

    # Builds the 'USE' CQL statement
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::Use]
    #
    def self.use(name)
      Statements::Use.new(name: name)
    end

  end # module CQL

end # module QueryBuilder
