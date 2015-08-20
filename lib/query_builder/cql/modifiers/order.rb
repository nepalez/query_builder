# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides ORDER clauses for statements
    #
    module Order

      # Adds ORDER clause to the statement
      #
      # @param [#to_s] name The name of the column
      # @param [:asc, :desc] order The order of clustering
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def order(name, order = :asc)
        self << Clause.new(name: name, desc: order.equal?(:desc))
      end

      private

      def maybe_order
        clauses(:order)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :order
        attribute :name, required: true
        attribute :desc, default: false

        # @private
        def to_s
          "ORDER BY (#{name} #{desc ? "DESC" : "ASC"})"
        end

      end # class Clause

    end # module Order

  end # module Modifiers

end # module QueryBuilder::CQL
