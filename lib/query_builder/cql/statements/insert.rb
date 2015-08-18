# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'INSERT' CQL3 statement
    #
    class Insert < Base

      include Modifiers::Insert
      include Modifiers::IfNotExists
      include Modifiers::UsingOptions

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["INSERT INTO", context.to_s, maybe_insert, maybe_using, maybe_if]
      end

    end # class Insert

  end # module Statements

end # module QueryBuilder::CQL
