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
        self << Clauses::Using.new(value: java_class)
      end

      private

      def maybe_using
        list = clauses(:using)
        list.any? ? ["USING", list.sort.join(" AND ")] : nil
      end

    end # module Using

  end # module Modifiers

end # module QueryBuilder::CQL
