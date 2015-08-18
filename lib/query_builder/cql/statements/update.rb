# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'UPDATE' CQL3 statement
    #
    class Update < Base

      include Modifiers::Update
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
          "UPDATE", context.to_s, maybe_using, maybe_set, maybe_where, maybe_if
        ]
      end

    end # class Update

  end # module Statements

end # module QueryBuilder::CQL
