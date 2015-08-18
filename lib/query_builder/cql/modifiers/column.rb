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
      def column(name, type_name, options = {})
        self << Clauses::Column
          .new(name: name, type_name: type_name, static: options[:static])
      end

      private

      def maybe_columns
        "(#{(clauses(:column) + clauses(:primary_key)).compact.join(", ")})"
      end

    end # module Column

  end # module Modifiers

end # module QueryBuilder::CQL
