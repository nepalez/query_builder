# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides columns for DELETE statement
    #
    module Delete

      # Adds columns that should be deleted
      #
      # @param [#to_s, Array<#to_s>] columns
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def delete(*columns)
        columns.map { |name| Clauses::Field.new(name: name) }.inject(self, :<<)
      end

      private

      def maybe_columns
        list = clauses(:column)
        [list.join(", ")] if list.any?
      end

    end # module Delete

  end # module Modifiers

end # module QueryBuilder::CQL
