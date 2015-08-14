# encoding: utf-8

module CQLBuilder

  module Clauses

    # Describes column definition
    #
    # @example
    #   clause = Column.new(name: :foo, type_name: :int, static: true)
    #   clause.to_s # => "foo int STATIC"
    #
    #   clause = Column.new(name: :foo, type_name: frozen(:int))
    #   clause.to_s # => "foo FROZEN<int>"
    #
    class Column < Clause

      type :column
      attribute :name, required: true
      attribute :type_name, required: true
      attribute :static, default: false

      # Returns the CQL representation of the clause
      #
      # @return [String]
      #
      def to_s
        [name.to_s, type_name.to_s, (static ? "STATIC" : nil)].compact.join(" ")
      end

    end # class Column

  end # module Clauses

end # module CQLBuilder
