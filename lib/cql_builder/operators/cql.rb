# encoding: utf-8

module CQLBuilder

  module Operators

    # Provides CQL statement from chunks
    #
    # @example
    #   fn = Operators[:cql]
    #   fn["USE", "", [], "my_keyspace"]
    #   # => "USE my_keyspace;"
    #
    # @param [Array<String, Array<String>>] parts
    #
    # @return [String]
    #
    def self.cql(*parts)
      parts
        .flatten
        .reject { |item| item.nil? || item.empty? }
        .map(&:to_s)
        .join(" ") << ";"
    end

  end # module Operators

end # module CQLBuilder
