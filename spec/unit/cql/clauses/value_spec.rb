# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Value do

  subject { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :value

  it_behaves_like :query_builder do
    let(:cql) { "'foo'" }
  end

end # describe QueryBuilder::CQL::Clauses::Value
