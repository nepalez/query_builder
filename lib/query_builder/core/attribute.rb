# encoding: utf-8

module QueryBuilder::Core

  # Describes the attribute of AST node
  #
  class Attribute

    include Equalizer.new(:name)

    # @!attribute [r] name
    #
    # @return [Symbol] The name of the attribute
    #
    attr_reader :name

    # @!attribute [r] default
    #
    # @return [Object] The default value for the attribute
    #
    attr_reader :default

    # @!attribute [r] required
    #
    # @return [Boolean] Whether the attribute is required or not
    #
    attr_reader :required

    # Initializes the attribute with name and options
    #
    # @param [Symbol] name
    # @param [Hash] options
    # @option options [Object] :default The default value for the attribute
    # @option options [Boolean] :required Whether the attribute is required
    #
    def initialize(name, options = {})
      @name     = name
      @default  = options[:default]
      @required = options.fetch(:required) { false }

      IceNine.deep_freeze(self)
    end

    # Returns arguments of the attribute initializer
    #
    # @return [Array]
    #
    def arguments
      [name, default: default, required: required]
    end

  end # class Attribute

end # module QueryBuilder::Core
