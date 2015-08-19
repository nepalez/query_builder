# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides STYPE clauses for statements
    #
    module Stype

      # Adds STYPE clause to the statement
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def stype(name)
        self << Clause.new(name: name)
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
        attribute :name, required: true

        # @private
        def to_s
          "STYPE #{name}"
        end

      end # class Clause

    end # module Stype

  end # module Modifiers

end # module QueryBuilder::CQL
