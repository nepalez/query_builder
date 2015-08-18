# encoding: utf-8

module QueryBuilder::CQL

  module Contexts

    # Describes the Cassandra table column
    #
    class Column < Base

      attribute :table, required: true
      attribute :name,  required: true

      # Builds the 'ALTER TABLE ... ADD' CQL statement
      #
      # @param [#to_s] type
      # @param [Hash] options
      # @option options [Boolean] :static
      #
      # @return [QueryBuilder::Statements::AddColumn]
      #
      def create(type, options = {})
        Statements::CreateColumn
          .new(context: self, type: type, static: options[:static])
      end

      # Builds the 'ALTER TABLE ... RENAME' CQL statement
      #
      # @param [#to_s] name
      #
      # @return [QueryBuilder::Statements::RenameColumn]
      #
      def rename(name)
        Statements::RenameColumn.new(context: self, name: name)
      end

      # Builds the 'ALTER TABLE ... ALTER' CQL statement
      #
      # @param [#to_s] type
      #
      # @return [QueryBuilder::Statements::AlterColumn]
      #
      def alter(type)
        Statements::AlterColumn.new(context: self, type: type)
      end

      # Builds the 'ALTER TABLE ... DROP' CQL statement
      #
      # @return [QueryBuilder::Statements::DropColumn]
      #
      def drop
        Statements::DropColumn.new(context: self)
      end

    end # class Column

  end # module Contexts

end # module QueryBuilder::CQL
