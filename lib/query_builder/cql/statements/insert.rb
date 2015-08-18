# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'INSERT' CQL3 statement
    #
    class Insert < Base

      include Modifiers::IfNotExists
      include Modifiers::UsingOptions

      # Defines value to be inserted
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Insert]
      #
      def insert(options)
        options.flat_map do |key, value|
          [Clauses::Field.new(name: key), Clauses::Value.new(name: value)]
        end.inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "INSERT INTO", context.to_s, maybe_columns, "VALUES", maybe_values,
          maybe_using, maybe_if
        ]
      end

      private

      def maybe_columns
        "(#{clauses(:field).join(", ")})"
      end

      def maybe_values
        "(#{clauses(:value).join(", ")})"
      end

    end # class Insert

  end # module Statements

end # module QueryBuilder::CQL
