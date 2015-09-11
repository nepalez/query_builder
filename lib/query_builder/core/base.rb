# encoding: utf-8

module QueryBuilder::Core

  # The abstract base class for all nodes of AST: statemens, clauses, operators
  #
  # Declares common attributes, `#initializer`, and `#to_s` instance methods.
  #
  # @abstract
  #
  class Base

    extend AttributesDSL

    # @!method initialize(attributes = {})
    # Initializes the instance
    #
    # @param [Hash] attributes The custom attributes of the instance
    #
    def initialize(_attributes = {})
      super
      IceNine.deep_freeze(self)
    end

    # @!method to_s
    # Returns the current chunk of CQL statement
    #
    # @return [String]
    #
    # @abstract
    #
    def to_s
      ""
    end

  end # class Base

end # module CQLBuiler::Core
