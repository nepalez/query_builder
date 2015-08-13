# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a WITH clause
    #
    # @example
    #   clause = With.new(column: :foo, value: gt(1))
    #   clause.type # => :with
    #   clause.to_s # => "'foo' > 1"
    #
    class With < Condition

      type :with

    end # class With

  end # module Clauses

end # module CQLBuilder
