# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Use do

  subject { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :use

  it_behaves_like :query_builder do
    let(:cql) { "foo" }
  end

end # describe QueryBuilder::CQL::Clauses::Use
