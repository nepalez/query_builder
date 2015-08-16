# encoding: utf-8

module CQLBuilder

  # The collection of pure functions that can be used as operators
  #
  # @example
  #   include Operators
  #
  #   fn = cql_gt(3)  # => #<Transproc::Function @name=:gt, @arguments=[3] ...>
  #   fn[:foo]    # => "'foo' > 3"
  #
  # @api public
  #
  module Operators

    extend Transproc::Registry

    require_relative "operators/cql_literal"
    require_relative "operators/cql"
    require_relative "operators/cql_map"
    require_relative "operators/cql_set"
    require_relative "operators/cql_list"
    require_relative "operators/cql_tuple"
    require_relative "operators/cql_frozen"
    require_relative "operators/cql_composite"
    require_relative "operators/cql_element"
    require_relative "operators/cql_in"
    require_relative "operators/cql_inc"
    require_relative "operators/cql_dec"
    require_relative "operators/cql_lt"
    require_relative "operators/cql_lte"
    require_relative "operators/cql_gt"
    require_relative "operators/cql_gte"

    private

    def respond_to_missing?(name, *)
      Operators.respond_to?(name)
    end

    def method_missing(name, *args)
      Operators[name, *args]
    end

  end # module Operators

end # module CQLBuilder
