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
        columns.map { |name| Clause.new(name: name) }.inject(self, :<<)
      end

      private

      def maybe_columns
        clauses(:column).join(", ")
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :column
        attribute :name, required: true

        # @private
        def to_s
          return name.to_s unless name.instance_of? Array
          "(#{name.join(", ")})"
        end

      end # class Clause

    end # module Delete

  end # module Modifiers

end # module QueryBuilder::CQL
