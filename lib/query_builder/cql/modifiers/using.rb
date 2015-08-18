# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides USING clauses for statements
    #
    module Using

      # Defines java class for the index
      #
      # @param [#to_s] java_class
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def using(java_class)
        self << Clause.new(value: java_class)
      end

      private

      def maybe_using
        list = clauses(:using)
        ["USING", list.sort.join(" AND ")] if list.any?
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :using
        attribute :value, required: true

        # @private
        def to_s
          cql_literal[value]
        end

      end # class Clause

    end # module Using

  end # module Modifiers

end # module QueryBuilder::CQL
