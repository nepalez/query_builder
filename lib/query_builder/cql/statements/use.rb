# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'USE' CQL3 statement
    #
    class Use < Base

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["USE", context.to_s]
      end

    end # class Use

  end # module Statements

end # module QueryBuilder::CQL
