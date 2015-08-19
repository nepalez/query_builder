# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... ADD' CQL3 statement
    #
    class CreateField < Base

      attribute :type, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TYPE", context.type.to_s, "ADD", context.name, type]
      end

    end # class CreateField

  end # module Statements

end # module QueryBuilder::CQL
