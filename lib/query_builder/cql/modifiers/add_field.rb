# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides fields for CREATE TYPE statement
    #
    module AddField

      # Adds field to the type
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(name, type)
        self << Clause.new(name: name, type_name: type)
      end

      private

      def maybe_fields
        "(#{clauses(:column).join(", ")})"
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :column
        attribute :name, required: true
        attribute :type_name, required: true

        # @private
        def to_s
          [name, type_name].join(" ")
        end

      end # class Clause

    end # module AddField

  end # module Modifiers

end # module QueryBuilder::CQL
