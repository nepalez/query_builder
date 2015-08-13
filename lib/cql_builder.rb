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
  #   statement.to_s # => "CREATE KEYSPACE IF NOT EXISTS 'name'"
  #
  # @param [#to_s] name The name of the keyspace
  #
  # @return [CQLBuilder::Statements::CreateKeyspace]
  #
  def self.create_keyspace(name)
    Statements::CreateKeyspace.new(name: name)
  end

end # module CQLBuilder
