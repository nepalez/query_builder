# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides column for CREATE INDEX statement
    #
    module AddColumn

      # Adds columns to the index
      #
      # @param [#to_s, Array<#to_s>] cols
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(*cols)
        cols.map { |col| Clauses::Field.new(name: col) }.inject(self, :<<)
      end

      private

      def maybe_columns
        "(#{clauses(:column).join(", ")})"
      end

    end # module AddColumn

  end # module Modifiers

end # module QueryBuilder::CQL
