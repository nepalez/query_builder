# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_tuple_value" do

  let(:arguments) { [:cql_tuple_value] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:name, 1] }
    let(:output) { "('name', 1)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_tuple_value
