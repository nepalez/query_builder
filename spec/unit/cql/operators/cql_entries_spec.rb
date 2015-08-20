# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_entries" do

  let(:arguments) { [:cql_entries] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "ENTRIES(foo)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_entries
