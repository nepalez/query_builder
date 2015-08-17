# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra users role
    #
    class Role < Base

      attribute :name, required: true

      # Returns the full name of the type
      #
      # @return [String]
      #
      def to_s
        name.to_s
      end

      # Builds the 'DROP ROLE' CQL statement
      #
      # @return [QueryBuilder::Statements::DropRole]
      #
      def drop
        Statements::DropRole.new(context: self)
      end

    end # class Role

  end # module Contexts

end # module QueryBuilder::CQL
