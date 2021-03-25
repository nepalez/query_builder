# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_lt" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_lt, 4] }

    let(:input)  { :foo }
    let(:output) { "foo < 4" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_lt, :bar] }

    let(:input)  { :foo }
    let(:output) { "foo < 'bar'" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:cql_function) { QueryBuilder::CQL::Operators[:cql_mintimeuuid, "2021-03-25 00:00:00 +0000"] }
    let(:arguments) { [:cql_lt, cql_function] }

    let(:input)  { :foo }
    let(:output) { "foo < MINTIMEUUID('2021-03-25 00:00:00 +0000')" }
  end

end # describe QueryBuilder::CQL::Operators.cql_lt
