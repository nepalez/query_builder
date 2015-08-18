# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TABLE ... ALTER' CQL3 statement
    #
    class AlterColumn < Base

      attribute :type, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "ALTER TABLE", context.table.to_s, "ALTER", context.name, "TYPE", type
        ]
      end

    end # class AlterColumn

  end # module Statements

end # module QueryBuilder::CQL
