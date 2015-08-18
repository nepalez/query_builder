# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'DELETE' CQL3 statement
    #
    class Delete < Base

      include Modifiers::Delete
      include Modifiers::Where
      include Modifiers::If
      include Modifiers::IfExists
      include Modifiers::UsingOptions

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "DELETE", maybe_columns, "FROM", context.to_s,
          maybe_using, maybe_where, maybe_if
        ]
      end

    end # class Delete

  end # module Statements

end # module QueryBuilder::CQL
