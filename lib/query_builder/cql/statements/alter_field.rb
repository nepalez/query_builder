# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... ALTER' CQL3 statement
    #
    class AlterField < Base

      attribute :type, required: :true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "ALTER TYPE", context.type.to_s, "ALTER", context.name, "TYPE", type
        ]
      end

    end # class AlterField

  end # module Statements

end # module QueryBuilder::CQL
