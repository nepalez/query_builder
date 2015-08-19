# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... ALTER' CQL3 statement
    #
    class AlterType < Base

      attribute :name, required: :true
      attribute :type, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TYPE", context.to_s, "ALTER", name, "TYPE", type]
      end

    end # class AlterType

  end # module Statements

end # module QueryBuilder::CQL
