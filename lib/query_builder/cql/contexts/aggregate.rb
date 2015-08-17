# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra user-defined aggregate
    #
    class Aggregate < Base

      attribute :keyspace, required: true
      attribute :name, required: true

      # Returns the full name of the aggregate
      #
      # @return [String]
      #
      def to_s
        [keyspace.to_s, name].join(".")
      end

      # Builds the 'DROP AGGREGATE' CQL statement
      #
      # @return [QueryBuilder::Statements::DropAggregate]
      #
      def drop
        Statements::DropAggregate.new(context: self)
      end

    end # class Aggregate

  end # module Contexts

end # module QueryBuilder::CQL
