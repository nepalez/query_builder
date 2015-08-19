# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides column for CALLED ON NULL statement
    #
    # @api public
    #
    module CalledOnNull

      # Adds CALLED ON NULL to the index
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def called_on_null
        self << Clause.new
      end

      private

      def maybe_called
        called = clauses(:called).last
        [(called ? called : "RETURNS NULL"), "ON NULL INPUT"].join(" ")
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :called

        # @private
        def to_s
          "CALLED"
        end

      end # class Clause

    end # module CalledOnNull

  end # module Modifiers

end # module QueryBuilder::CQL
