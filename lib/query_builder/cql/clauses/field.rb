# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes column or field
  #
  # @example
  #   clause = Field.new(name: :foo)
  #   clause.type # => :field
  #   clause.to_s # => "foo"
  #
  class Field < Base

    type :field

    attribute :name, required: true

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      return name.to_s unless name.instance_of? Array
      "(#{name.flatten.map(&:to_s).join(", ")})"
    end

  end # class Field

end # module QueryBuilder::CQL::Clauses
