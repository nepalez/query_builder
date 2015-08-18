# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TABLE ... RENAME' CQL3 statement
    #
    class RenameColumn < Base

      attribute :name, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "ALTER TABLE", context.table.to_s, "RENAME", context.name, "TO", name
        ]
      end

    end # class RenameColumn

  end # module Statements

end # module QueryBuilder::CQL
