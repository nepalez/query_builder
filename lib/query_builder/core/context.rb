# encoding: utf-8

module QueryBuilder::Core

  # Abstract base class for CQL context
  #
  # The context describes either a keyspace (db) or a column family (table).
  # It has the `to_s` method to return the context name.
  #
  # @abstract
  #
  class Context < Base

  end # class Context

end # module QueryBuilder::Core
