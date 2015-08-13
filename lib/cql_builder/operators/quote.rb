# encoding: utf-8

module CQLBuilder

  module Operators

    class << self

      # Converts value to the quoted/unquoted string representing chunk of CQL
      #
      # @example
      #   fn = Operators[:quote]
      #   fn[nil]      # => "NaN"
      #   fn["0x9232"] # => "0x9232"
      #   fn[:foo]     # => "'foo'"
      #
      # @param [Object] value
      #
      # @return [String]
      #
      def quote(value)
        return "NaN"             if nan?(value)
        return "Infinity"        if infinity?(value)
        return value.to_s        if unchanged?(value)
        return quote_hash(value) if value.instance_of?(Hash)
        "'#{value}'"
      end

      private

      def quote_hash(value)
        "{#{value.map { |k, v| [quote(k), quote(v)].join(": ") }.join ", "}}"
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

  end # module Operators

end # module CQLBuilder
