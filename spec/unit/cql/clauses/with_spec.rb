# encoding: utf-8

describe QueryBuilder::CQL::Clauses::With do

  subject { described_class.new(args) }

  let(:args) { { column: :foo, value: :bar } }

  it_behaves_like :a_clause, :with

  it_behaves_like :query_builder do
    let(:cql) { "foo = 'bar'" }
  end

  it_behaves_like :query_builder do
    let(:args) { { column: :foo, value: -> col { "COUNT(#{col})" } } }
    let(:cql)  { "COUNT(foo)" }
  end

end # describe QueryBuilder::CQL::Clauses::With
