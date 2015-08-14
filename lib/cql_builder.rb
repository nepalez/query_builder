# encoding: utf-8

require "equalizer"
require "ice_nine"
require "transproc"

require_relative "cql_builder/attribute"
require_relative "cql_builder/exceptions"
require_relative "cql_builder/operators"
require_relative "cql_builder/base"
require_relative "cql_builder/clause"
require_relative "cql_builder/statement"

# The builder of CQL statements
#
module CQLBuilder

  # Builds the 'CREATE KEYSPACE' CQL statement
  #
  # @see https://cassandra.apache.org/doc/cql3/CQL.html#createKeyspaceStmt
  #   Apache CQL documentation
  #
  # @example
  #   statement = CQLBuilder.create_keyspace(:name).if_not_exists
  #   statement.to_s # => "CREATE KEYSPACE IF NOT EXISTS name;"
  #
  # @param [#to_s] name The name of the keyspace
  #
  # @return [CQLBuilder::Statements::CreateKeyspace]
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
  #   statement = CQLBuilder.use(:name)
  #   statement.to_s # => "USE name;"
  #
  # @param [#to_s] name The name of the keyspace
  #
  # @return [CQLBuilder::Statements::Use]
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
  #   statement = CQLBuilder.alter_keyspace(:name)
  #   statement.to_s # => "ALTER KEYSPACE name;"
  #
  # @param [#to_s] name The name of the keyspace
  #
  # @return [CQLBuilder::Statements::AlterKeyspace]
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
  #   statement = CQLBuilder.drop_keyspace(:name).if_exists
  #   statement.to_s # => "DROP KEYSPACE IF EXISTS name;"
  #
  # @param [#to_s] name The name of the keyspace
  #
  # @return [CQLBuilder::Statements::DropKeyspace]
  #
  def self.drop_keyspace(name)
    Statements::DropKeyspace.new(name: name)
  end

  # Builds the 'TRUNCATE' CQL statement
  #
  # @see https://cassandra.apache.org/doc/cql3/CQL.html#dropTableStmt
  #   Apache CQL documentation
  #
  # @example
  #   statement = CQLBuilder.drop_table(:name).if_exists
  #   statement.to_s # => "TRUNCATE IF EXISTS name;"
  #
  # @param [#to_s] name The name of the table
  #
  # @return [CQLBuilder::Statements::DropTable]
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
  #   statement = CQLBuilder.drop_type(:name).if_exists
  #   statement.to_s # => "DROP TYPE IF EXISTS name;"
  #
  # @param [#to_s] name The name of the type
  #
  # @return [CQLBuilder::Statements::DropType]
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
  #   statement = CQLBuilder.drop_user(:name).if_exists
  #   statement.to_s # => "DROP USER IF EXISTS name;"
  #
  # @param [#to_s] name The name of the user
  #
  # @return [CQLBuilder::Statements::DropUser]
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
  #   statement = CQLBuilder.list_users
  #   statement.to_s # => "LIST USERS;"
  #
  # @return [CQLBuilder::Statements::ListUsers]
  #
  def self.list_users
    Statements::ListUsers.new
  end

  # Builds the 'TRUNCATE' CQL statement
  #
  # @see https://cassandra.apache.org/doc/cql3/CQL.html#truncateStmt
  #   Apache CQL documentation
  #
  # @example
  #   statement = CQLBuilder.truncate(:name).if_exists
  #   statement.to_s # => "TRUNCATE IF EXISTS name;"
  #
  # @param [#to_s] name The name of the table
  #
  # @return [CQLBuilder::Statements::Truncate]
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
  #   statement = CQLBuilder.create_user(:name).if_not_exists
  #   statement.to_s # => "CREATE USER IF NOT EXISTS name;"
  #
  # @param [#to_s] name The name of the user
  #
  # @return [CQLBuilder::Statements::CreateUser]
  #
  def self.create_user(name)
    Statements::CreateUser.new(name: name)
  end

  # Builds the 'ALTER USER' CQL statement
  #
  # @see https://cassandra.apache.org/doc/cql3/CQL.html#alterUserStmt
  #   Apache CQL documentation
  #
  # @example
  #   statement = CQLBuilder.alter_user(:name).if_not_exists
  #   statement.to_s # => "ALTER USER IF NOT EXISTS name;"
  #
  # @param [#to_s] name The name of the user
  #
  # @return [CQLBuilder::Statements::AlterUser]
  #
  def self.alter_user(name)
    Statements::AlterUser.new(name: name)
  end

end # module CQLBuilder
