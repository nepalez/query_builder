# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes a password for a CREATE USER statement
    #
    # @example
    #   clause = WithPassword.new(password: :foo)
    #   clause.type # => :with_password
    #   clause.to_s # => "WITH PASSWORD 'foo'"
    #
    class WithPassword < Clause

      type :with_password
      attribute :password, required: true

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        "WITH PASSWORD #{literal[password.to_s]}"
      end

    end # class WithPassword

  end # module Clauses

end # module CQLBuilder
