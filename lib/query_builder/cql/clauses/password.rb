# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes a keyspace for the clause
  #
  # @example
  #   clause = Password.new(name: :foo)
  #   clause.to_s # => "PASSWORD 'foo'"
  #
  class Password < Base

    unique
    type :with
    attribute :name, required: true

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      "PASSWORD #{cql_literal[name]}"
    end

  end # class Password

end # module QueryBuilder::CQL::Clauses
