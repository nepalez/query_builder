 # encoding: utf-8

 describe QueryBuilder::CQL::Operators, ".cql_maxtimeuuid" do

   let(:arguments) { [:cql_maxtimeuuid] }
   let(:timestamp) { Time.new("2013-02-02 10:00+0000")  }

   it_behaves_like :transforming_immutable_data do
     let(:input)  { timestamp.to_s }
     let(:output) { "MAXTIMEUUID('#{input}')" }
   end

 end # describe QueryBuilder::CQL::Operators.cql_maxtimeuuid
