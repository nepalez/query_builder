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
        self << Clauses::Superuser.new(reverse: !option)
      end

      private

      def maybe_superuser
        clauses(:superuser)
      end

    end # module Superuser

  end # module Modifiers

end # module QueryBuilder::CQL
