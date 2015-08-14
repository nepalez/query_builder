# encoding: utf-8

module CQLBuilder

  module Operators

    # Provides CQL identifier
    #
    # @example
    #   fn = Operators[:identifier]
    #   fn["my \" keyspace"]
    #   # => "\"my keyspace\""
    #
    # @param [String] str
    #
    # @return [String]
    #
    def self.identifier(str)
      "\"#{str.to_s.gsub("\"", "\"\"")}\""
    end

  end # module Operators

end # module CQLBuilder
