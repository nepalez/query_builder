# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE FUNCTION' CQL3 statement
    #
    class CreateAggregate < Base

      include Modifiers::OrReplace
      include Modifiers::IfNotExists
      include Modifiers::AddField
      include Modifiers::Sfunc
      include Modifiers::Stype
      include Modifiers::Finalfunc
      include Modifiers::Initcond

      alias_method :argument, :add

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE", maybe_replace, "AGGREGATE", maybe_if, context.to_s,
          maybe_fields, maybe_functions
        ]
      end

    end # class CreateAggregate

  end # module Statements

end # module QueryBuilder::CQL
