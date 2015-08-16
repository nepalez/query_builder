# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes IF EXISTS clause
    #
    class Exists < Clause

      type :if
      attribute :reverse, default: false

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        [maybe_not, "EXISTS"].compact.join(" ")
      end

      private

      def maybe_not
        "NOT" if reverse
      end

    end # class Exists

  end # module Clauses

end # module CQLBuilder
