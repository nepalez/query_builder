# encoding: utf-8

describe CQLBuilder::Clauses::Superuser do

  subject { described_class.new(args) }

  let(:args) { {} }

  it_behaves_like :a_clause, :superuser

  it_behaves_like :cql_builder do
    let(:cql) { "SUPERUSER" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { reverse: true } }
    let(:cql)  { "NOSUPERUSER" }
  end

end # describe CQLBuilder::Clauses::Superuser
