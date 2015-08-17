# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_keys" do

  let(:arguments) { [:cql_keys] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "KEYS(foo)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_keys
