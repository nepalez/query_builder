# encoding: utf-8

module QueryBuilder::CQL

  module Modifiers

    # Provides columns and values for INSERT statement
    #
    module Insert

      # Defines value to be inserted
      #
      # @param [Hash] options
      #
      # @return [QueryBuilder::Core::Statement] updated statement
      #
      def insert(options)
        options
          .flat_map { |k, v| [Column.new(name: k), Value.new(name: v)] }
          .inject(self, :<<)
      end

      private

      def maybe_insert
        [:column, :value]
          .map { |type| "(#{clauses(type).join(", ")})" }
          .join(" VALUES ")
      end

      # The clause defining a column
      #
      # @api private
      #
      class Column < Base

        type :column
        attribute :name, required: true

        # @private
        def to_s
          return name.to_s unless name.instance_of? Array
          "(#{name.join(", ")})"
        end

      end # class Column

      # The clause defining a value
      #
      # @api private
      #
      class Value < Base

        type :value
        attribute :name, required: true

        # @private
        def to_s
          cql_literal[name]
        end

      end # class Value

    end # module Insert

  end # module Modifiers

end # module QueryBuilder::CQL
