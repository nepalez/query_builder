# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TABLE ... DROP' CQL3 statement
    #
    class DropColumn < Base

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TABLE", context.table.to_s, "DROP", context.name]
      end

    end # class DropColumn

  end # module Statements

end # module QueryBuilder::CQL
