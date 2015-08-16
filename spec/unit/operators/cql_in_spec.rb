# encoding: utf-8

describe CQLBuilder::Operators, ".cql_in" do

  let(:arguments) { [:cql_in, :bar, :baz] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "foo IN ('bar', 'baz')" }
  end

end # describe CQLBuilder::Operators.cql_in
