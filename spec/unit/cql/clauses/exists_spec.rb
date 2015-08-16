# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Exists do

  subject { described_class.new(args) }

  let(:args) { {} }

  it_behaves_like :a_clause, :if

  it_behaves_like :query_builder do
    let(:cql) { "EXISTS" }
  end

  it_behaves_like :query_builder do
    let(:args) { { reverse: true } }
    let(:cql)  { "NOT EXISTS" }
  end

end # describe QueryBuilder::CQL::Clauses::Exists
