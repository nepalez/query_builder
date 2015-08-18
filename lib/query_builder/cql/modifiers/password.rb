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
        self << Clause.new(name: name)
      end

      private

      def maybe_with
        list = clauses(:with)
        ["WITH", list.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :with
        attribute :name, required: true

        # @private
        def to_s
          "PASSWORD #{cql_literal[name]}"
        end

      end # class Clause

    end # module Superuser

  end # module Modifiers

end # module QueryBuilder::CQL
