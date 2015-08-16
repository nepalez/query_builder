# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Set do

  subject { described_class.new(args) }

  let(:args) { { column: :foo, value: :bar } }

  it_behaves_like :a_clause, :set

  it_behaves_like :query_builder do
    let(:cql) { "foo = 'bar'" }
  end

  it_behaves_like :query_builder do
    let(:args) { { column: :foo, value: -> col { "#{col} = #{col} + 1" } } }
    let(:cql)  { "foo = foo + 1" }
  end

end # describe QueryBuilder::CQL::Clauses::Set
