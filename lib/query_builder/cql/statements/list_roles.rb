# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'LIST ROLES;' CQL3 statement
    #
    class ListRoles < Base

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        "LIST ROLES;"
      end

    end # class ListRoles

  end # module Statements

end # module QueryBuilder::CQL
