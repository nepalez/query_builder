# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes COMPACT STORAGE clause in a CREATE USER statement
  #
  # @example
  #   CompactStorage.new.to_s # => "COMPACT STORAGE"
  #
  class CompactStorage < Base

    type :with

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      "COMPACT STORAGE"
    end

  end # class CompactStorage

end # module QueryBuilder::CQL::Clauses
