# encoding: utf-8

describe CQLBuilder::Operators, ".cql_list" do

  let(:arguments) { [:cql_list] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :int }
    let(:output) { "list<int>" }
  end

end # describe CQLBuilder::Operators.cql_list
