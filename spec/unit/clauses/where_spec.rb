# encoding: utf-8

describe CQLBuilder::Clauses::Where do

  subject { described_class.new(args) }

  let(:args) { { column: :foo, value: :bar } }

  it_behaves_like :a_clause, :where

  it_behaves_like :cql_builder do
    let(:cql) { "foo = 'bar'" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { column: :foo, value: -> col { "COUNT(#{col})" } } }
    let(:cql)  { "COUNT(foo)" }
  end

end # describe CQLBuilder::Clauses::Where
