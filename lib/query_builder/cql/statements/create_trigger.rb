# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TRIGGER' CQL3 statement
    #
    class CreateTrigger < Base

      include Modifiers::IfNotExists

      # Defines java class for the trigger
      #
      # @param [#to_s] java_class
      #
      # @return [QueryBuilder::Statements::CreateTrigger]
      #
      def using(java_class)
        self << Clauses::Using.new(value: java_class)
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE TRIGGER", maybe_if, context.name.to_s,
          "ON", context.table.to_s, maybe_using
        ]
      end

      private

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

    end # class CreateTrigger

  end # module Statements

end # module QueryBuilder::CQL
