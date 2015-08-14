# encoding: utf-8

describe CQLBuilder::Operators, ".cql_map" do

  let(:arguments) { [:cql_map] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:foo, :bar] }
    let(:output) { "map<foo, bar>" }
  end

end # describe CQLBuilder::Operators.cql_map
