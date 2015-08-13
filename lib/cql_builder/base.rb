# encoding: utf-8

module CQLBuilder

  # The abstract base class for all nodes of AST: statemens, clauses, operators
  #
  # Declares common attributes, `#initializer`, and `#to_s` instance methods.
  #
  # @abstract
  #
  class Base

    include Comparable
    include Exceptions
    include Equalizer.new(:class, :attributes)

    # @!method attributes
    # The hash of default attributes of class' instances
    #
    # @return [Hash]
    #
    def self.attributes
      @attributes ||= Set.new
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
      attributes << Attribute.new(name, options)
      define_method(name) { attributes.fetch(name) }
    end

    # Makes default attributes inheritable
    #
    # @private
    #
    def self.inherited(subclass)
      attributes.each do |item|
        subclass.public_send(:attribute, *item.arguments)
      end
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
      validate_unknown attributes
      validate_missing attributes

      @attributes = default_attributes.merge(attributes)
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

    private

    def known_attributes
      self.class.attributes
    end

    def required_attributes
      known_attributes.select(&:required)
    end

    def default_attributes
      known_attributes.each_with_object({}) { |e, a| a[e.name] = e.default }
    end

    def validate_unknown(hash)
      unknown = hash.keys - known_attributes.map(&:name)
      fail AttributeError.new(:unknown, unknown) if unknown.any?
    end

    def validate_missing(hash)
      missed = required_attributes.map(&:name) - hash.keys
      fail AttributeError.new(:missed, missed) if missed.any?
    end

  end # class Base

end # module CQLBuilde
