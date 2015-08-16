# encoding: utf-8

require_relative "condition"

module QueryBuilder::CQL::Clauses

  # Describes a part of IF clause
  #
  # @example
  #   clause = If.new(column: :foo, value: gt(1))
  #   clause.type # => :if
  #   clause.to_s # => "foo > 1"
  #
  class If < Condition

    type :if

  end # class If

end # module QueryBuilder::CQL::Clauses
