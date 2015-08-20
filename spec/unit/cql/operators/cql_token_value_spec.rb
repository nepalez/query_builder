# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_token_value" do

  let(:arguments) { [:cql_token_value] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :name }
    let(:output) { "TOKEN('name')" }
  end

end # describe QueryBuilder::CQL::Operators.cql_token_value
