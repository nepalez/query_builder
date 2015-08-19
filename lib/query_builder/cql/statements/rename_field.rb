# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... RENAME' CQL3 statement
    #
    class RenameField < Base

      attribute :name, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TYPE", context.type.to_s, "RENAME", context.name, "TO", name]
      end

    end # class RenameField

  end # module Statements

end # module QueryBuilder::CQL
