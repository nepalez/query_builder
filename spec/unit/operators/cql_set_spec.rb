# encoding: utf-8

describe CQLBuilder::Operators, ".cql_set" do

  let(:arguments) { [:cql_set] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "set<foo>" }
  end

end # describe CQLBuilder::Operators.cql_set
