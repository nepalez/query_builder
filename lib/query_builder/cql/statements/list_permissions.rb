# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'GRANT' CQL3 statement
    #
    class ListPermissions < Base

      include Modifiers::Norecursive

      attribute :name, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "LIST", permission, "ON", context.to_s, "OF", name, maybe_norecursive
        ]
      end

      private

      def permission
        context.name ? "#{context.name.upcase} PERMISSION" : "ALL PERMISSIONS"
      end

    end # class ListPermissions

  end # module Statements

end # module QueryBuilder::CQL
