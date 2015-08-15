# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a keyspace for the clause
    #
    # @example
    #   clause = On.new(name: :foo)
    #   clause.type # => :on
    #   clause.to_s # => "foo"
    #
    class On < Clause

      type :on
      attribute :name, required: true

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        name.to_s
      end

    end # class On

  end # module Clauses

end # module CQLBuilder
