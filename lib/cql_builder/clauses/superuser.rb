# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes SUPERUSER|NOSUPERUSER clauses in a CREATE USER statement
    #
    # @example
    #   Superuser.new.to_s                # => "SUPERUSER"
    #   Superuser.new(reverse: true).to_s # => "NOSUPERUSER"
    #
    class Superuser < Clause

      type :superuser
      attribute :reverse, default: false

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        "#{reverse ? "NO" : ""}SUPERUSER"
      end

    end # class Superuser

  end # module Clauses

end # module CQLBuilder
