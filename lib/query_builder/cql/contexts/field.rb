# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the field of Cassandra user-defined type
    #
    class Field < Base

      attribute :type, required: true
      attribute :name, required: true

      # Builds the 'ALTER TYPE ... ADD' CQL statement
      #
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Statements::CreateField]
      #
      def create(type)
        Statements::CreateField.new(context: self, type: type)
      end

      # Builds the 'ALTER TYPE ... ALTER' CQL statement
      #
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Statements::AlterField]
      #
      def alter(type)
        Statements::AlterField.new(context: self, type: type)
      end

      # Builds the 'ALTER TYPE ... RENAME' CQL statement
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::RenameField]
      #
      def rename(name)
        Statements::RenameField.new(context: self, name: name)
      end

    end # class Field

  end # module Contexts

end # module QueryBuilder::CQL
