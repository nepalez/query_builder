# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides the list of selected columns for SELECT statement
    #
    module Selected

      # Adds a column
      #
      # @param [Array] values
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def select(*values)
        return self if values.empty?
        hash = values.last.instance_of?(Hash) ? values.pop : {}
        list = values.map { |name| Clause.new(name: name) }
        list += hash.map { |as, name| Clause.new(name: name, as: as) }
        list.inject(self, :<<)
      end

      private

      def maybe_selected
        list = clauses(:selected)
        list.any? ? list.join(", ") : "*"
      end

      # The clause for adding to a statement
      #
      # @api private
      #
      class Clause < Base

        type :selected

        attribute :name, required: true
        attribute :as

        # @private
        def to_s
          [name, (as ? "AS" : nil), as].compact.join(" ")
        end

      end # class Clause

    end # module Selected

  end # module Modifiers

end # module QueryBuilder::CQL
