# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides (NO)SUPERUSER clauses for statements
    #
    module Superuser

      # Adds (NO)SUPERUSER clause to the statement
      #
      # @param [Boolean] option (true)
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def superuser(option = true)
        self << Clause.new(reverse: !option)
      end

      private

      def maybe_superuser
        clauses(:superuser)
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        unique
        type :superuser
        attribute :reverse, default: false

        # @private
        def to_s
          "#{maybe_no}SUPERUSER"
        end

        private

        def maybe_no
          "NO" if reverse
        end

      end # class Clause

    end # module Superuser

  end # module Modifiers

end # module QueryBuilder::CQL
