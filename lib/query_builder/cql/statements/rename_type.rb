# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... RENAME' CQL3 statement
    #
    class RenameType < Base

      attribute :from, required: :true
      attribute :into, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TYPE", context.to_s, "RENAME", from, "TO", into]
      end

    end # class RenameType

  end # module Statements

end # module QueryBuilder::CQL
