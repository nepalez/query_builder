# encoding: utf-8

describe QueryBuilder::CQL::Clauses::CompactStorage do

  subject { described_class.new }

  it_behaves_like :a_clause, :with

  it_behaves_like :query_builder do
    let(:cql) { "COMPACT STORAGE" }
  end

end # describe QueryBuilder::CQL::Clauses::CompactStorage
