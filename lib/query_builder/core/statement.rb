# encoding: utf-8

module QueryBuilder::Core

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
    # @param (see QueryBuilder::Clause)
    # @param [Proc] block
    #   The block that returns an array of clauses for the statement
    #
    def initialize(*)
      @clauses = block_given? ? Array[*yield] : []
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
    # @param [QueryBuilder::Clause] clause
    #
    # @return [QueryBuilder::Statement]
    #
    def <<(clause)
      new_clauses = @clauses.dup
      new_clauses.delete clause
      self.class.new(attributes) { new_clauses + [clause] }
    end

  end # class Statement

end # module QueryBuilder::Core
