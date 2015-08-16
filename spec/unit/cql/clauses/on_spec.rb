# encoding: utf-8

describe QueryBuilder::CQL::Clauses::On do

  subject { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :on

  it_behaves_like :query_builder do
    let(:cql) { "foo" }
  end

end # describe QueryBuilder::CQL::Clauses::On
