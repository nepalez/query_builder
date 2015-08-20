# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'BATCH' CQL3 statement
    #
    class Batch < Base

      include Modifiers::Statement
      include Modifiers::Counter
      include Modifiers::Timestamp
      include Modifiers::Unlogged

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "BEGIN", maybe_type, "BATCH", maybe_using,
          maybe_statements, "APPLY BATCH"
        ]
      end

    end # class Batch

  end # module Statements

end # module QueryBuilder::CQL
