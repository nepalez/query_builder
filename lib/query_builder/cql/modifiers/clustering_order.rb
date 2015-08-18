# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides CLUSTERING ORDER clauses for statements
    #
    module ClusteringOrder

      # Adds CLUSTERNING ORDER clause to the statement
      #
      # @param [#to_s] name The name of the column
      # @param [:asc, :desc] order The order of clustering
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def clustering_order(name, order = :asc)
        self << Clause.new(name: name, desc: order.equal?(:desc))
      end

      private

      def maybe_where
        list = clauses(:where)
        ["WHERE", list.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :with
        attribute :name, required: true
        attribute :desc, default: false

        # @private
        def to_s
          "CLUSTERING ORDER BY (#{name} #{desc ? "DESC" : "ASC"})"
        end

      end # class Clause

    end # module ClusteringOrder

  end # module Modifiers

end # module QueryBuilder::CQL
