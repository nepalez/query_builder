# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes a part of USING clause
  #
  # @example
  #   Using.new(value: "bar.baz.qux").to_s       # => "'bar.baz.qux'"
  #   Using.new(property: :ttl, value: 100).to_s # => "TTL 100"
  #
  # @abstract
  #
  # @api private
  #
  class Using < Base

    type :using

    attribute :property
    attribute :value, required: true

    # The CQL chunk representing the condition
    #
    # @return [String]
    #
    def to_s
      property ? "#{full_property} #{full_value}" : full_value
    end

    private

    def full_property
      property.upcase
    end

    def full_value
      cql_literal[value]
    end

  end # class Using

end # module QueryBuilder::CQL::Clauses
