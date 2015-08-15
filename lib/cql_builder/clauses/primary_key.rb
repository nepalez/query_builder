# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a keyspace for the clause
    #
    # @example
    #   clause = PrimaryKey.new(columns: [:foo])
    #   clause.to_s # => "PRIMARY KEY \"foo\""
    #
    #   clause = PrimaryKey.new(columns: [:foo, :bar, :baz])
    #   clause.to_s # => "PRIMARY KEY (\"foo\", \"bar\", \"baz\")"
    #
    class PrimaryKey < Clause

      type :primary_key
      attribute :columns, required: true

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        ["PRIMARY KEY", "(#{columns.join(", ")})"].join(" ")
      end

    end # class PrimaryKey

  end # module Clauses

end # module CQLBuilder
