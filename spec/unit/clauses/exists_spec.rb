# encoding: utf-8

describe CQLBuilder::Clauses::Exists do

  subject { described_class.new(args) }

  let(:args) { {} }

  it_behaves_like :a_clause, :if

  it_behaves_like :cql_builder do
    let(:cql) { "EXISTS" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { reverse: true } }
    let(:cql)  { "NOT EXISTS" }
  end

end # describe CQLBuilder::Clauses::Exists
