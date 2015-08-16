# encoding: utf-8

module CQLBuilder

  # The exception to be raised by AST nodes' initializers
  #
  class AttributeError < KeyError

    # Initializes the error with problem definition and the list of attributes
    #
    # @param [#to_s] problem
    # @param [Array<#to_s>] list
    #
    def initialize(problem, list)
      super [
        "#{problem} attribute",
        (list.one? ? ": " : "s: "),
        list.map { |item| ":#{item}" }.join(", ")
      ].join
      IceNine.deep_freeze(self)
    end

  end # class UndefinedAttributeError

end # module CQLBuilder
