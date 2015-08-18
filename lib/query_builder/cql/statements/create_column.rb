# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TABLE ... ADD' CQL3 statement
    #
    class CreateColumn < Base

      attribute :type, required: :true
      attribute :static

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "ALTER TABLE", context.table.to_s,
          "ADD", context.name, type, maybe_static
        ]
      end

      private

      def maybe_static
        "STATIC" if static
      end

    end # class CreateColumn

  end # module Statements

end # module QueryBuilder::CQL
