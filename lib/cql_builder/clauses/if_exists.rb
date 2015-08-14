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
        ["IF", maybe_not, "EXISTS"].compact.join(" ")
      end

      private

      def maybe_not
        "NOT" if reverse
      end

    end # class IfExists

  end # module Clauses

end # module CQLBuilder
