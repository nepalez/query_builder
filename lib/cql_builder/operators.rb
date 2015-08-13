# encoding: utf-8

module CQLBuilder

  # The collection of pure functions that can be used as operators
  #
  # @example
  #   include Operators
  #
  #   fn = quote  # => #<Transproc::Function @name=:quote ...>
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

    require_relative "operators/quote"
    require_relative "operators/cql"

    private

    def respond_to_missing?(name, *)
      Operators.respond_to?(name)
    end

    def method_missing(name, *args)
      Operators[name, *args]
    end

  end # module Operators

end # module CQLBuilder
