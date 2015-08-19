# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE FUNCTION' CQL3 statement
    #
    class CreateFunction < Base

      include Modifiers::AddField
      include Modifiers::OrReplace
      include Modifiers::IfNotExists
      include Modifiers::Returns
      include Modifiers::CalledOnNull

      attribute :language, required: true
      attribute :body, required: true

      alias_method :argument, :add

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "CREATE", maybe_replace, "FUNCTION", maybe_if,
          context.to_s, maybe_fields, maybe_called, maybe_returns,
          "LANGUAGE", cql_literal[language], "AS", cql_literal[body]
        ]
      end

    end # class CreateField

  end # module Statements

end # module QueryBuilder::CQL
