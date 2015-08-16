# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes column or field
  #
  # @example
  #   clause = Value.new(name: :foo)
  #   clause.type # => :value
  #   clause.to_s # => "foo"
  #
  class Value < Base

    type :value

    attribute :name, required: true

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      name.to_s
    end

  end # class Value

end # module QueryBuilder::CQL::Clauses
