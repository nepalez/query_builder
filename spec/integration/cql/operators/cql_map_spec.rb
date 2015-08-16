# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_map" do

  let(:arguments) { [:cql_map] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:foo, :bar] }
    let(:output) { "MAP<foo, bar>" }
  end

end # describe QueryBuilder::CQL::Operators.cql_map
