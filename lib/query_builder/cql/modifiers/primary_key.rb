# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides PRIMARY KEY clause for a statement
    #
    module PrimaryKey

      # Defines a primary key for the table
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def primary_key(*columns)
        self << Clause.new(columns: columns)
      end

      private

      def maybe_columns
        "(#{(clauses(:column) + clauses(:primary_key)).compact.join(", ")})"
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :primary_key
        attribute :columns, required: true

        # Returns the CQL representation of the clause
        #
        # @return [String]
        #
        def to_s
          ["PRIMARY KEY", "(#{columns.join(", ")})"].join(" ")
        end

      end # class Clause

    end # module PrimaryKey

  end # module Modifiers

end # module QueryBuilder::CQL
