# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_tuple" do

  let(:arguments) { [:cql_tuple] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:int, :text] }
    let(:output) { "TUPLE<int, text>" }
  end

end # describe QueryBuilder::CQL::Operators.cql_tuple
