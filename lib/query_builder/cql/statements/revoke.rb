# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'REVOKE' CQL3 statement
    #
    class Revoke < Base

      attribute :name, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["REVOKE", permission, "ON", context.to_s, "FROM", name]
      end

      private

      def permission
        context.name ? "#{context.name.upcase} PERMISSION" : "ALL PERMISSIONS"
      end

    end # class Revoke

  end # module Statements

end # module QueryBuilder::CQL
