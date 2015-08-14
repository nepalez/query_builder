# encoding: utf-8

module CQLBuilder

  module Statements

    # Describes the 'LIST USERS;' CQL3 statement
    #
    class ListUsers < Statement

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        "LIST USERS;"
      end

    end # class ListUsers

  end # module Statements

end # module CQLBuilder
