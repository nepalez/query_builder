# encoding: utf-8

module CQLBuilder

  # The abstract base class for all nodes of AST: statemens, clauses, operators
  #
  # Declares common attributes, `#initializer`, and `#to_cql` instance methods.
  #
  # @abstract
  #
  class Base

    include Comparable
    include Equalizer.new(:class, :attributes)

    # @!method attributes
    # The hash of default attributes of class' instances
    #
    # @return [Hash]
    #
    def self.attributes
      @attributes ||= {}
    end

    # @!method attribute(name, options)
    # Declares the attribute with optional default value
    #
    # @param [Symbol] name The name of the attribute
    # @param [Hash] options
    # @option options [Object] :default
    #
    # @return [undefined]
    #
    def self.attribute(name, options = {})
      attributes[name] = options[:default]
      define_method(name) { attributes.fetch(name) }
    end

    # Makes default attributes inheritable
    #
    # @private
    #
    def self.inherited(subclass)
      attributes.each { |k, v| subclass.public_send(:attribute, k, default: v) }
    end

    # @!attribute [r] attributes
    #
    # @return [Hash] The hash of the initialized attributes
    #
    attr_reader :attributes

    # @!method initialize(attributes = {})
    # Initializes the instance
    #
    # @param [Hash] attributes The custom attributes of the instance
    #
    def initialize(attributes = {})
      default     = self.class.attributes
      @attributes = default.merge(attributes.select { |k| default.include? k })
      IceNine.deep_freeze(self)
    end

    # @!method to_cql
    # Returns the current chunk of CQL statement
    #
    # @return [String]
    #
    def to_cql
      ""
    end

  end # class Base

end # module CQLBuilde
