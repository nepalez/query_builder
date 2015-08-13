# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a keyspace for the clause
    #
    # @example
    #   clause = Use.new(name: :foo)
    #   clause.type # => :use
    #   clause.to_s # => "'foo'"
    #
    class Use < Clause

      type :use
      attribute :name, required: true

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        quote[name]
      end

    end # class Use

  end # module Clauses

end # module CQLBuilder
