# encoding: utf-8

module CQLBuilder

  # The abstract base class for the CQL operators applicable to columns
  #
  class Operator < Base

    attribute :value

    # @!method to_s(column)
    # Returns CQL chunk for the column
    #
    # @param [Symbol] column
    #
    # @return [String]
    #
    def to_s(_)
      ""
    end

  end # class Operator

  # The collection of concrete operators with their builders
  #
  module Operators

  end # module Operators

end # module CQLBuilder
