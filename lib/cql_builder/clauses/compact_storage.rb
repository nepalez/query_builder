# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes COMPACT STORAGE clause in a CREATE USER statement
    #
    # @example
    #   CompactStorage.new.to_s # => "COMPACT STORAGE"
    #
    class CompactStorage < Clause

      type :with

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        "COMPACT STORAGE"
      end

    end # class CompactStorage

  end # module Clauses

end # module CQLBuilder
