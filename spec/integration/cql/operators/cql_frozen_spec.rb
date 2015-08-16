# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_frozen" do

  let(:arguments) { [:cql_frozen] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "FROZEN <foo>" }
  end

end # describe QueryBuilder::CQL::Operators.cql_frozen
