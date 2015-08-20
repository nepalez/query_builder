# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_list" do

  let(:arguments) { [:cql_list] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :int }
    let(:output) { "LIST<int>" }
  end

end # describe QueryBuilder::CQL::Operators.cql_list
