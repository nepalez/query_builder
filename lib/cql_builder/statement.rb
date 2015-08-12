# encoding: utf-8

module CQLBuilder

  # Abstract base class for CQL statemens (roots of AST)
  #
  # The statement is created with several clauses (like WHERE, SET etc.)
  #
  # @abstract
  #
  class Statement < Base

    # @!method initialize(type, *attributes, &block)
    # Initializes the statement with a type, attributes and block
    #
    # @param (see CQLBuilder::Clause)
    # @param [Proc] block
    #   The block that returns an array of clauses for the statement
    #
    def initialize(*)
      list = yield if block_given?
      @clauses = Set.new(list)
      super
    end

    # @!method clauses(type = nil)
    # Returns array of chunks of code for the statement's clauses
    #
    # @param [Symbol] type The optional type to select clauses by
    #
    # @return [Array<String>]
    #
    def clauses(cond = nil)
      (cond ? @clauses.select { |item| cond.equal? item.type } : @clauses)
        .map(&:to_s)
    end

    # @!method <<(clause)
    # Returns a new statement where the clause is added
    #
    # @param [CQLBuilder::Clause] clause
    #
    # @return [CQLBuilder::Statement]
    #
    def <<(clause)
      self.class.new(attributes) { @clauses + [clause] }
    end

  end # class Statement

end # module CQLBuilder
