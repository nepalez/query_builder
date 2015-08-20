# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'SELECT' CQL3 statement
    #
    class Select < Base

      include Modifiers::Selected
      include Modifiers::Count
      include Modifiers::Where
      include Modifiers::WhereClustered
      include Modifiers::Order
      include Modifiers::Distinct
      include Modifiers::Limit
      include Modifiers::AllowFiltering

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql[
          "SELECT", maybe_distinct, maybe_selected, "FROM", context.to_s,
          maybe_where, maybe_order, maybe_limit, maybe_filter
        ]
      end

    end # class Select

  end # module Statements

end # module QueryBuilder::CQL
