 # encoding: utf-8

 require_relative "cql_literal"

 module QueryBuilder::CQL::Operators

   # Returns value of CQL MAXTIMEUUID
   #
   # @example
   #   fn = Operators[:cql_maxtimeuuid]
   #
   #   fn[:string_timestamp]
   #   # => "MAXTIMEUUID('2013-02-02 10:00+0000')"
   #
   # @param [#to_s] value
   #
   # @return [String]
   #
   def self.cql_maxtimeuuid(value)
     "MAXTIMEUUID(#{cql_literal(value)})"
   end

 end # module QueryBuilder::CQL::Operators
