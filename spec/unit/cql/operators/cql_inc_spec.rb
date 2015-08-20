# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_inc" do

  let(:arguments) { [:cql_inc, 4] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "foo = foo + 4" }
  end

end # describe QueryBuilder::CQL::Operators.cql_inc
