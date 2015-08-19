# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides FINALFUNC clauses for statements
    #
    module Finalfunc

      # Adds FINALFUNC clause to the statement
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def finalfunc(name)
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
          "FINALFUNC #{name}"
        end

      end # class Clause

    end # module Finalfunc

  end # module Modifiers

end # module QueryBuilder::CQL
