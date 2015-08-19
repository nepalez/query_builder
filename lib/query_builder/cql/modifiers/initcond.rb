# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides INITCOND clauses for statements
    #
    module Initcond

      # Adds INITCOND clause to the statement
      #
      # @param [#to_s] left
      # @param [#to_s] right
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def initcond(left, right)
        self << Clause.new(left: left, right: right)
      end

      private

      def maybe_functions
        clauses(:function).join(" ")
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :function
        attribute :left,  required: true
        attribute :right, required: true

        # @private
        def to_s
          "INITCOND (#{left}, #{right})"
        end

      end # class Clause

    end # module Initcond

  end # module Modifiers

end # module QueryBuilder::CQL
