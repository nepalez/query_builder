# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides WHERE clauses for clustered columns in statements
    #
    module WhereClustered

      # Adds WHERE clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def where_clustered(options)
        self << Clause.new(columns: options.keys, values: options.values)
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

        type :where
        attribute :columns, required: true
        attribute :values,  required: true

        def to_s
          [
            "(#{columns.join(", ")})",
            "(#{values.map { |value| cql_literal[value] }.join(", ")})"
          ].join(" = ")
        end

      end # class Clause

    end # module WhereClustered

  end # module Modifiers

end # module QueryBuilder::CQL
