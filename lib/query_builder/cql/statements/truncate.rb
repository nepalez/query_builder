# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'TRUNCATE' CQL3 statement
    #
    class Truncate < Base

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["TRUNCATE", context.to_s]
      end

    end # class Truncate

  end # module Statements

end # module QueryBuilder::CQL
