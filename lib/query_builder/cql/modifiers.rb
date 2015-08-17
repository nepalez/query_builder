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

      Dir[File.expand_path("../modifiers/*.rb", __FILE__)].each(&method(:load))

    end # module Modifiers

  end # module CQL

end # module QueryBuilder
