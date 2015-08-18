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
        self << Clauses::ClusteringOrder
          .new(name: name, desc: order.equal?(:desc))
      end

      private

      def maybe_where
        list = clauses(:where)
        ["WHERE", list.join(" AND ")] if list.any?
      end

    end # module ClusteringOrder

  end # module Modifiers

end # module QueryBuilder::CQL
