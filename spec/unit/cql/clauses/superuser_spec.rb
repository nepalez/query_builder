# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Superuser do

  subject { described_class.new(args) }

  let(:args) { {} }

  it_behaves_like :a_clause, :superuser

  it_behaves_like :query_builder do
    let(:cql) { "SUPERUSER" }
  end

  it_behaves_like :query_builder do
    let(:args) { { reverse: true } }
    let(:cql)  { "NOSUPERUSER" }
  end

end # describe QueryBuilder::CQL::Clauses::Superuser
