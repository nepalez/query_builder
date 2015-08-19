# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides column for CREATE INDEX statement
    #
    # @api public
    #
    module Returns

      # Adds return type to the index
      #
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def returns(type)
        self << Clause.new(type_name: type)
      end

      private

      def maybe_returns
        clauses(:returns)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :returns
        attribute :type_name, required: true

        # @private
        def to_s
          "RETURNS #{type_name}"
        end

      end # class Clause

    end # module Returns

  end # module Modifiers

end # module QueryBuilder::CQL
