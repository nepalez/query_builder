# encoding: utf-8

describe CQLBuilder::Clauses::CompactStorage do

  subject { described_class.new }

  it_behaves_like :a_clause, :with

  it_behaves_like :cql_builder do
    let(:cql) { "COMPACT STORAGE" }
  end

end # describe CQLBuilder::Clauses::CompactStorage
