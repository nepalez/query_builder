# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes IF EXISTS clause
    #
    class IfExists < Clause

      type :if_exists
      attribute :reverse, default: false

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        ["IF", (reverse ? "NOT" : nil), "EXISTS"].compact.join(" ")
      end

    end # class IfExists

  end # module Clauses

end # module CQLBuilder
