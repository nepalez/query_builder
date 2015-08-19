# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'ALTER TYPE ... ADD' CQL3 statement
    #
    class UpdateType < Base

      attribute :name, required: true
      attribute :type, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["ALTER TYPE", context.to_s, "ADD", name, type]
      end

    end # class UpdateType

  end # module Statements

end # module QueryBuilder::CQL
