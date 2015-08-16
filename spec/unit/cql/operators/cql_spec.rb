# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql" do

  let(:arguments) { [:cql] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { ["FOO", "", [], nil, "'bar'"] }
    let(:output) { "FOO 'bar';" }
  end

end # describe QueryBuilder::CQL::Operators.cql
