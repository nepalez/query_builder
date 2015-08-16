# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'USE' CQL3 statement
    #
    class Use < Base

      attribute :name, required: true

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["USE", name.to_s]
      end

    end # class Use

  end # module Statements

end # module QueryBuilder::CQL
