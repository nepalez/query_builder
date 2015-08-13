# encoding: utf-8

module CQLBuilder

  # The collection of pure functions that can be used as operators
  #
  # @example
  #   include Operators
  #
  #   operator = quote   # => #<Transproc::Function @name=:quote ...>
  #   operator[:foo]     # => "'foo'"
  #   operator[1]        # => "1"
  #
  #   operator = count   # => #<Transproc::Function @name=:count ...>
  #   operator[:foo]     # => "COUNT(foo)"
  #
  #   transproc = gt[3]  # => #<Transproc::Function @name=:gt ...>
  #   transproc[:foo]    # => "'foo' > 3"
  #
  module Operators

    extend Transproc::Registry

    require_relative "operators/quote"

    private

    def respond_to_missing?(name, *)
      Operators.respond_to?(name)
    end

    def method_missing(name, *args)
      Operators[name, *args]
    end

  end # module Operators

end # module CQLBuilder
