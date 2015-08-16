# encoding: utf-8

module QueryBuilder::CQL::Operators

  class << self

    # Converts value to CQL cql_literal
    #
    # @example
    #   fn = Operators[:cql_literal]
    #   fn[nil]      # => "NaN"
    #   fn["0x9232"] # => "0x9232"
    #   fn[:foo]     # => "'foo'"
    #
    # @param [Object] value
    #
    # @return [String]
    #
    def cql_literal(value)
      return "NaN"               if nan?(value)
      return "Infinity"          if infinity?(value)
      return value.to_s          if unchanged?(value)
      return cql_literal_hash(value) if value.instance_of?(Hash)
      quote(value)
    end

    private

    def cql_literal_hash(value)
      str =
        value
        .map { |k, v| [cql_literal(k), cql_literal(v)].join(": ") }
        .join(", ")
      "{#{str}}"
    end

    def quote(value)
      "'#{value.to_s.gsub("\'", "\'\'")}'"
    end

    def nan?(value)
      value.nil? || value.to_s.eql?("NaN")
    end

    def infinity?(value)
      value.to_s.eql?("Infinity")
    end

    def unchanged?(value)
      number?(value) || uuid?(value) || blob?(value) || bool?(value)
    end

    def uuid?(value)
      value.to_s[/^\h{8}(-\h{4}){3}-\h{12}$/]
    end

    def blob?(value)
      value.to_s[/^0[xX]./]
    end

    def number?(value)
      value.is_a? Numeric
    end

    def bool?(value)
      [true, false].include? value
    end

  end

end # module QueryBuilder::CQL::Operators
