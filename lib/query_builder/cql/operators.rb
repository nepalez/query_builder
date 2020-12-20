# encoding: utf-8

module QueryBuilder

  module CQL

    # The collection of CQL-specific operators (building blocks for statements)
    #
    module Operators

      extend Dry::Transformer::Registry

      private

      def respond_to_missing?(name, *)
        Operators.respond_to?(name)
      end

      def method_missing(name, *args)
        Operators[name, *args]
      end

      Dir[File.expand_path("../operators/*.rb", __FILE__)].each(&method(:load))

    end # module Clauses

  end # module CQL

end # module QueryBuilder
