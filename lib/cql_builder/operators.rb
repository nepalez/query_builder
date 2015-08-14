# encoding: utf-8

module CQLBuilder

  # The collection of pure functions that can be used as operators
  #
  # @example
  #   include Operators
  #
  #   fn = literal  # => #<Transproc::Function @name=:literal ...>
  #   fn[:foo]    # => "'foo'"
  #   fn[1]       # => "1"
  #
  #   fn = count  # => #<Transproc::Function @name=:count ...>
  #   fn[:foo]    # => "COUNT(foo)"
  #
  #   fn = gt(3)  # => #<Transproc::Function @name=:gt, @arguments=[3] ...>
  #   fn[:foo]    # => "'foo' > 3"
  #
  # @api public
  #
  module Operators

    extend Transproc::Registry

    require_relative "operators/literal"
    require_relative "operators/identifier"
    require_relative "operators/cql"
    require_relative "operators/cql_map"
    require_relative "operators/cql_set"
    require_relative "operators/frozen"

    private

    def respond_to_missing?(name, *)
      Operators.respond_to?(name)
    end

    def method_missing(name, *args)
      Operators[name, *args]
    end

  end # module Operators

end # module CQLBuilder
