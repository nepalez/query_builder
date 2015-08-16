# encoding: utf-8

module QueryBuilder

  require_relative "cql/operators"
  require_relative "cql/clauses"
  require_relative "cql/statements"

  # The builder for CQL-specific statements
  #
  module CQL

    # Builds the 'CREATE KEYSPACE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#createKeyspaceStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.create_keyspace(:name).if_not_exists
    #   statement.to_s # => "CREATE KEYSPACE IF NOT EXISTS name;"
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::CreateKeyspace]
    #
    def self.create_keyspace(name)
      Statements::CreateKeyspace.new(name: name)
    end

    # Builds the 'USE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#useStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.use(:name)
    #   statement.to_s # => "USE name;"
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::Use]
    #
    def self.use(name)
      Statements::Use.new(name: name)
    end

    # Builds the 'ALTER KEYSPACE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#alterKeyspaceStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.alter_keyspace(:name)
    #   statement.to_s # => "ALTER KEYSPACE name;"
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::AlterKeyspace]
    #
    def self.alter_keyspace(name)
      Statements::AlterKeyspace.new(name: name)
    end

    # Builds the 'DROP KEYSPACE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropKeyspaceStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_keyspace(:name).if_exists
    #   statement.to_s # => "DROP KEYSPACE IF EXISTS name;"
    #
    # @param [#to_s] name The name of the keyspace
    #
    # @return [QueryBuilder::Statements::DropKeyspace]
    #
    def self.drop_keyspace(name)
      Statements::DropKeyspace.new(name: name)
    end

    # Builds the 'DROP TABLE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropTableStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_table(:name).if_exists
    #   statement.to_s # => "DROP TABLE IF EXISTS name;"
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::DropTable]
    #
    def self.drop_table(name)
      Statements::DropTable.new(name: name)
    end

    # Builds the 'DROP TYPE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropTypeStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_type(:name).if_exists
    #   statement.to_s # => "DROP TYPE IF EXISTS name;"
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
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropUserStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_user(:name).if_exists
    #   statement.to_s # => "DROP USER IF EXISTS name;"
    #
    # @param [#to_s] name The name of the user
    #
    # @return [QueryBuilder::Statements::DropUser]
    #
    def self.drop_user(name)
      Statements::DropUser.new(name: name)
    end

    # Builds the 'LIST USERS' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#listUsersStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.list_users
    #   statement.to_s # => "LIST USERS;"
    #
    # @return [QueryBuilder::Statements::ListUsers]
    #
    def self.list_users
      Statements::ListUsers.new
    end

    # Builds the 'DROP TABLE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#truncateStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.truncate(:name).if_exists
    #   statement.to_s # => "TRUNCATE IF EXISTS name;"
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Truncate]
    #
    def self.truncate(name)
      Statements::Truncate.new(name: name)
    end

    # Builds the 'CREATE USER' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#createUserStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.create_user(:name).if_not_exists
    #   statement.to_s # => "CREATE USER IF NOT EXISTS name;"
    #
    # @param [#to_s] name
    # @param [#to_s] password
    #
    # @return [QueryBuilder::Statements::CreateUser]
    #
    def self.create_user(name, password)
      Statements::CreateUser.new(name: name, password: password)
    end

    # Builds the 'ALTER USER' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#alterUserStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.alter_user(:name).if_not_exists
    #   statement.to_s # => "ALTER USER IF NOT EXISTS name;"
    #
    # @param [#to_s] name
    # @param [#to_s] password
    #
    # @return [QueryBuilder::Statements::AlterUser]
    #
    def self.alter_user(name, password)
      Statements::AlterUser.new(name: name, password: password)
    end

    # Builds the 'CREATE TABLE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#createTableStmt
    #   Apache CQL documentation
    #
    # @example
    #   QueryBuilder.create_table(:foo).if_not_exists.column(:bar, :int).to_s
    #   # => "CREATE TABLE IF NOT EXISTS foo (bar int);"
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
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#createTypeStmt
    #   Apache CQL documentation
    #
    # @example
    #   QueryBuilder.create_type(:foo).if_not_exists.field(:bar, :int).to_s
    #   # => "CREATE TYPE IF NOT EXISTS foo (bar int);"
    #
    # @param [#to_s] name The name of the type
    #
    # @return [QueryBuilder::Statements::CreateType]
    #
    def self.create_type(name)
      Statements::CreateType.new(name: name)
    end

    # Builds the 'DROP INDEX' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropIndexStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_index(:name).if_exists
    #   statement.to_s # => "DROP INDEX IF EXISTS name;"
    #
    # @param [#to_s] name The name of the index
    #
    # @return [QueryBuilder::Statements::DropIndex]
    #
    def self.drop_index(name)
      Statements::DropIndex.new(name: name)
    end

    # Builds the 'DROP TRIGGER' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropTriggerStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.drop_trigger(:name).on(:foo).if_exists
    #   statement.to_s # => "DROP TRIGGER IF EXISTS name ON foo;"
    #
    # @param [#to_s] name The name of the trigger
    #
    # @return [QueryBuilder::Statements::DropTrigger]
    #
    def self.drop_trigger(name)
      Statements::DropTrigger.new(name: name)
    end

    # Builds the 'DELETE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#deleteStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.delete_from(:foo).value(:bar)
    #   statement.to_s # => "DELETE bar FROM foo;"
    #
    # @param [#to_s] name The name of the table
    #
    # @return [QueryBuilder::Statements::Delete]
    #
    def self.delete_from(name)
      Statements::Delete.new(name: name)
    end

    # Builds the 'UPDATE' CQL statement
    #
    # @see https://cassandra.apache.org/doc/cql3/CQL.html#updateStmt
    #   Apache CQL documentation
    #
    # @example
    #   statement = QueryBuilder.update(:foo).set(bar: :baz)
    #   statement.to_s # => "UPDATE foo SET bar = 'baz';"
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
