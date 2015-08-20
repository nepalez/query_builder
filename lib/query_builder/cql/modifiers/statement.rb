# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Adds statements to CQL BATCH
    #
    module Statement

      # Adds the statement
      #
      # @param [#to_s] statement
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def add(statement)
        self << Clause.new(statement: statement)
      end

      private

      def maybe_statements
        clauses(:statement).join(" ")
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :statement
        attribute :statement, required: true

        # @private
        def to_s
          statement.to_s
        end

      end # class Clause

    end # module Statement

  end # module Modifiers

end # module QueryBuilder::CQL
