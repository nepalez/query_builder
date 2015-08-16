# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a part of SET clause
    #
    # @example
    #   clause = Set.new(column: :foo, value: cql_inc(1))
    #   clause.type # => :set
    #   clause.to_s # => "foo = foo + 1"
    #
    class Set < Condition

      type :set

    end # class Set

  end # module Clauses

end # module CQLBuilder
