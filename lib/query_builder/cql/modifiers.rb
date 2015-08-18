# encoding: utf-8

module QueryBuilder

  module CQL

    # The collection of statement modifiers
    #
    # Every modifier contains two methods:
    # * public method to add clause(s) to the statement
    # * private method to collect statement clause(s)
    #
    module Modifiers

      # Base class for modifier-provided clauses
      #
      class Base < Core::Clause

        include Operators

      end # class Base

      # The base class for clauses, describing conditions (like "foo = 'foo'")
      #
      # @api private
      #
      class BaseCondition < Base

        include Equalizer.new(:class, :column)

        attribute :column, required: true
        attribute :value,  required: true

        # @private
        def to_s
          return operator  if value.respond_to?(:call)
          return inclusion if value.instance_of? Array
          equality
        end

        private

        def equality
          "#{column} = #{cql_literal[value]}"
        end

        def inclusion
          cql_in[column, *value]
        end

        def operator
          value[column]
        end

      end # class BaseCondition

      Dir[File.expand_path("../modifiers/*.rb", __FILE__)].each(&method(:load))

    end # module Modifiers

  end # module CQL

end # module QueryBuilder
