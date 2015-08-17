# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'UPDATE' CQL3 statement
    #
    class Update < Base

      include Modifiers::Where
      include Modifiers::IfExists
      include Modifiers::UsingOptions

      # Adds SET clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def set(options)
        options
          .map { |key, value| Clauses::Set.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Adds IF clause to the statement
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Statements::Update]
      #
      def if(options)
        options
          .map { |key, value| Clauses::If.new(column: key, value: value) }
          .inject(self, :<<)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "UPDATE", context.to_s, maybe_using, maybe_set, maybe_where, maybe_if
        ]
      end

      private

      def maybe_set
        list = clauses(:set)
        ["SET", list.join(", ")] if list.any?
      end

    end # class Update

  end # module Statements

end # module QueryBuilder::CQL
