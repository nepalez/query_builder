# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_set" do

  let(:arguments) { [:cql_set] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "SET<foo>" }
  end

end # describe QueryBuilder::CQL::Operators.cql_set
