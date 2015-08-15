# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes CLUSTERING ORDER clause
    #
    # @example
    #   ClusteringOrder.new(name: :foo, desc: true).to_s
    #   # => "CLUSTERING ORDER (foo DESC)"
    #
    # @api private
    #
    class ClusteringOrder < Clause

      type :with

      attribute :name, required: true
      attribute :desc, default: false

      # The CQL chunk representing the condition
      #
      # @return [String]
      #
      def to_s
        "CLUSTERING ORDER BY (#{name} #{desc ? "DESC" : "ASC"})"
      end

    end # class ClusteringOrder

  end # module Clauses

end # module CQLBuilder
