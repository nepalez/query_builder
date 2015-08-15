# encoding: utf-8

describe CQLBuilder::Clauses::On do

  subject { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :on

  it_behaves_like :cql_builder do
    let(:cql) { "foo" }
  end

end # describe CQLBuilder::Clauses::On
