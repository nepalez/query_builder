# encoding: utf-8

module QueryBuilder

  # The collection of core classes and modules to provide SQL-specific AST
  #
  module Core

    require_relative "core/attribute_error"
    require_relative "core/attribute"
    require_relative "core/base"
    require_relative "core/clause"
    require_relative "core/statement"

  end # module Core

end # module QueryBuilder
