# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_full" do

  let(:arguments) { [:cql_full] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "FULL(foo)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_full
