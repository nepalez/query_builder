# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'GRANT' CQL3 statement
    #
    class Grant < Base

      attribute :name, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["GRANT", permission, "ON", context.to_s, "TO", name]
      end

      private

      def permission
        context.name ? "#{context.name.upcase} PERMISSION" : "ALL PERMISSIONS"
      end

    end # class Grant

  end # module Statements

end # module QueryBuilder::CQL
