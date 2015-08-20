# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_element" do

  let(:arguments) { [:cql_element, :bar] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "foo['bar']" }
  end

end # describe QueryBuilder::CQL::Operators.cql_element
