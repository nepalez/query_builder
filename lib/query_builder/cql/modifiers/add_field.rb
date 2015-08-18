# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides fields for CREATE TYPE statement
    #
    module AddField

      # Adds field to the type
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(options)
        options
          .map { |key, value| Clauses::Column.new(name: key, type_name: value) }
          .inject(self, :<<)
      end

      private

      def maybe_fields
        "(#{clauses(:column).join(", ")})"
      end

    end # module AddField

  end # module Modifiers

end # module QueryBuilder::CQL
