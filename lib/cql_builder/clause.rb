# encoding: utf-8

module CQLBuilder

  # The base class for all AST clauses (parts of statement)
  #
  # @abstract
  #
  class Clause < Base

    include Equalizer.new(:type, :attributes)

    # @!attribute [r] type
    #
    # @return [Symbol] The type of the node
    #
    attr_reader :type

    # @!method initialize(type)
    # Initializes the node of a corresponding type with a hash of attributes
    #
    # @param [Symbol] type The mandatory type of the node
    # @param [Hash] attributes The optional hash of named attributes
    #
    def initialize(type, attributes = {})
      @type = type
      super(attributes)
    end

    # @!method to_cql
    # Returns the current chunk of CQL statement
    #
    # @return [String] The type in upper case
    #
    def to_cql
      type.to_s.upcase
    end

  end # class Clause

end # module CQLBuilder
