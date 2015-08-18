# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides USING clauses for statements with various options
    #
    module UsingOptions

      # Adds USING clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def using(options)
        options
          .map { |key, value| Clause.new(property: key, value: value) }
          .inject(self, :<<)
      end

      private

      def maybe_using
        list = clauses(:using)
        ["USING", list.sort.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :using
        attribute :property, required: true
        attribute :value, required: true

        # @private
        def to_s
          "#{property.upcase} #{cql_literal[value]}"
        end

      end # class Clause

    end # module UsingOptions

  end # module Modifiers

end # module QueryBuilder::CQL
