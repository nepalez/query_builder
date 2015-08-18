# encoding: utf-8

module QueryBuilder

  module CQL

    # The collection of CQL-specific contexts for statements
    #
    module Contexts

      # The base class for CQL-specific contexts
      #
      Base = Core::Base

      Dir[File.expand_path("../contexts/*.rb", __FILE__)].each(&method(:load))

    end # module Contexts

  end # module CQL

end # module QueryBuilder
