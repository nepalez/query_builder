# encoding: utf-8

describe CQLBuilder::Clauses::Value do

  subject { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :value

  it_behaves_like :cql_builder do
    let(:cql) { "foo" }
  end

end # describe CQLBuilder::Clauses::Value
