# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_composite" do

  let(:arguments) { [:cql_composite] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:foo, :bar, :baz] }
    let(:output) { "(foo, bar, baz)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_composite
