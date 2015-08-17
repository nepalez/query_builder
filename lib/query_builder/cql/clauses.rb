# encoding: utf-8

module QueryBuilder

  module CQL

    # The collection of CQL-specific clauses (building blocks for statements)
    #
    module Clauses

      # The base class for CQL-specific clauses
      #
      class Base < Core::Clause

        include Operators # CQL-specific

      end # class Base

      Dir[File.expand_path("../clauses/*.rb", __FILE__)].each(&method(:load))

    end # module Clauses

  end # module CQL

end # module QueryBuilder
