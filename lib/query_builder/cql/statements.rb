# encoding: utf-8

module QueryBuilder

  module CQL

    # The collection of CQL-specific statements
    #
    module Statements

      # The base class for CQL-specific statements
      #
      class Base < Core::Statement

        include Operators # CQL-specific

      end # class Base

      Dir[File.expand_path("../statements/*.rb", __FILE__)].each(&method(:load))

    end # module Statements

  end # module CQL

end # module QueryBuilder
