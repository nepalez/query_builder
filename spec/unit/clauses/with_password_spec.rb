# encoding: utf-8

describe CQLBuilder::Clauses::WithPassword do

  subject { described_class.new(password: :foo) }

  it_behaves_like :a_clause, :with_password

  it_behaves_like :cql_builder do
    let(:cql) { "WITH PASSWORD 'foo'" }
  end

end # describe CQLBuilder::Clauses::WithPassword
