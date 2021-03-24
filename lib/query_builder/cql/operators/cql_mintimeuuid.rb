 # encoding: utf-8

 require_relative "cql_literal"

 module QueryBuilder::CQL::Operators

   # Returns value of CQL MINTIMEUUID
   #
   # @example
   #   fn = Operators[:cql_mintimeuuid]
   #
   #   fn[:string_timestamp]
   #   # => "MINTIMEUUID('2013-02-02 10:00+0000')"
   #
   # @param [#to_s] value
   #
   # @return [String]
   #
   def self.cql_mintimeuuid(value)
     "MINTIMEUUID(#{cql_literal(value)})"
   end

 end # module QueryBuilder::CQL::Operators
