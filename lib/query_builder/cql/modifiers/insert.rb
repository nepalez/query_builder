# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides columns and values for INSERT statement
    #
    module Insert

      # Defines value to be inserted
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def insert(options)
        options.flat_map do |key, value|
          [Clauses::Field.new(name: key), Clauses::Value.new(name: value)]
        end.inject(self, :<<)
      end

      private

      def maybe_insert
        [:column, :value]
          .map { |type| "(#{clauses(type).join(", ")})" }
          .join(" VALUES ")
      end

    end # module Insert

  end # module Modifiers

end # module QueryBuilder::CQL
