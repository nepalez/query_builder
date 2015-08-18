# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides PASSWORD clauses for statements
    #
    module Password

      # Adds PASSWORD clause to the statement
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def password(name)
        self << Clauses::Password.new(name: name)
      end

      private

      def maybe_with
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

    end # module Superuser

  end # module Modifiers

end # module QueryBuilder::CQL
