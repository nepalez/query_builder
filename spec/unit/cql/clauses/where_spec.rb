# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Where do

  subject { described_class.new(args) }

  let(:args) { { column: :foo, value: :bar } }

  it_behaves_like :a_clause, :where

  it_behaves_like :query_builder do
    let(:cql) { "foo = 'bar'" }
  end

  it_behaves_like :query_builder do
    let(:args) { { column: :foo, value: [:bar, :baz] } }
    let(:cql)  { "foo IN ('bar', 'baz')" }
  end

  it_behaves_like :query_builder do
    let(:args) { { column: :foo, value: -> col { "#{col} < 3" } } }
    let(:cql)  { "foo < 3" }
  end

end # describe QueryBuilder::CQL::Clauses::Where
