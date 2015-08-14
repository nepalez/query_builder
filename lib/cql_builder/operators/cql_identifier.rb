# encoding: utf-8

module CQLBuilder

  module Operators

    # Provides CQL cql_identifier
    #
    # @example
    #   fn = Operators[:cql_identifier]
    #   fn["my \" keyspace"]
    #   # => "\"my keyspace\""
    #
    # @param [String] str
    #
    # @return [String]
    #
    def self.cql_identifier(str)
      "\"#{str.to_s.gsub("\"", "\"\"")}\""
    end

  end # module Operators

end # module CQLBuilder
