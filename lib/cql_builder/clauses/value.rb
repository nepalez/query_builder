# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes column or field
    #
    # @example
    #   clause = Value.new(name: :foo)
    #   clause.type # => :value
    #   clause.to_s # => "foo"
    #
    class Value < Clause

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

  end # module Clauses

end # module CQLBuilder
