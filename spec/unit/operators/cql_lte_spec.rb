# encoding: utf-8

describe CQLBuilder::Operators, ".cql_lte" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_lte, 4] }

    let(:input)  { :foo }
    let(:output) { "foo <= 4" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:cql_lte, :bar] }

    let(:input)  { :foo }
    let(:output) { "foo <= 'bar'" }
  end

end # describe CQLBuilder::Operators.cql_lte
