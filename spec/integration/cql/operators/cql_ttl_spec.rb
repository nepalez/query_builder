# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_ttl" do

  let(:arguments) { [:cql_ttl] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :name }
    let(:output) { "TTL(name)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_ttl
