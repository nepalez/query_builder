# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides columns for CREATE TYPE statement
    #
    module Column

      # Adds column to the table
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      # @param [Hash] options
      # @option options [Boolean] :static
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(name, type_name, options = {})
        self << Clause
          .new(name: name, type_name: type_name, static: options[:static])
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

        type :column
        attribute :name, required: true
        attribute :type_name, required: true
        attribute :static, default: false

        # @private
        def to_s
          [name, type_name, maybe_static].compact.join(" ")
        end

        private

        def maybe_static
          "STATIC" if static
        end

      end # class Clause

    end # module Column

  end # module Modifiers

end # module QueryBuilder::CQL
