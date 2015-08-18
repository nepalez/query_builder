# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides column for CREATE INDEX statement
    #
    # @api public
    #
    module AddColumn

      # Adds columns to the index
      #
      # @param [#to_s, Array<#to_s>] cols
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(*cols)
        cols.map { |col| Clause.new(name: col) }.inject(self, :<<)
      end

      private

      def maybe_columns
        "(#{clauses(:column).join(", ")})"
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

    end # module AddColumn

  end # module Modifiers

end # module QueryBuilder::CQL
