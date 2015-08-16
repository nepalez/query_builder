# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes a keyspace for the clause
  #
  # @example
  #   clause = Use.new(name: :foo)
  #   clause.type # => :use
  #   clause.to_s # => "foo"
  #
  class Use < Base

    type :use

    attribute :name, required: true

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      name.to_s
    end

  end # class Use

end # module QueryBuilder::CQL::Clauses
