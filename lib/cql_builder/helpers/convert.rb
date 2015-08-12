# encoding: utf-8

module CQLBuilder

  module Helpers

    # Converts value to the quoted/unquoted string representing chunk of CQL
    #
    # @example
    #   Helpers.convert(nil)    # => "NaN"
    #   Helpers.convert(0x9232) # => "0x9232"
    #   Helpers.convert(:foo)   # => "'foo'"
    #
    # @param [Object] value
    #
    # @return [String]
    #
    def self.convert(value)
      return "NaN"      if nan?(value)
      return "Infinity" if infinity?(value)
      return value.to_s if unchanged?(value)
      return convert_hash(value) if value.is_a? Hash
      "'#{value}'"
    end

    private

    def self.convert_hash(value)
      "{#{value.map { |k, v| [convert(k), convert(v)].join(": ") }.join ", "}}"
    end

    def self.nan?(value)
      value.nil? || (value.to_s == "NaN")
    end

    def self.infinity?(value)
      value.to_s == "Infinity"
    end

    def self.unchanged?(value)
      number?(value) || uuid?(value) || blob?(value) || bool?(value)
    end

    def self.uuid?(value)
      value.to_s[/^\h{8}(-\h{4}){3}-\h{12}$/] ? true : false
    end

    def self.blob?(value)
      value.to_s[/^0[xX]./] ? true : false
    end

    def self.number?(value)
      value.is_a? Numeric
    end

    def self.bool?(value)
      [true, false].include? value
    end

  end # module Helpers

end # module CQLBuilder
