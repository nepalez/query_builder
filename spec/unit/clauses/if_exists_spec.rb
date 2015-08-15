# encoding: utf-8

describe CQLBuilder::Clauses::IfExists do

  subject { described_class.new(args) }

  let(:args) { {} }

  it_behaves_like :a_clause, :if_exists

  it_behaves_like :cql_builder do
    let(:cql) { "IF EXISTS" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { reverse: true } }
    let(:cql)  { "IF NOT EXISTS" }
  end

end # describe CQLBuilder::Clauses::IfExists
