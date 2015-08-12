# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes IF NOT EXISTS clause
    #
    class IfNotExists < Clause

      type :if_not_exists

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        "IF NOT EXISTS"
      end

    end # class IfNotExists

  end # module Clauses

end # module CQLBuilder
