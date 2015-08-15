# encoding: utf-8

describe CQLBuilder::Clauses::Column do

  subject { described_class.new(args) }

  let(:args) { { name: :foo, type_name: :int } }

  it_behaves_like :a_clause, :column

  it_behaves_like :cql_builder do
    let(:cql) { "foo int" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { name: :foo, type_name: :int, static: true } }
    let(:cql)  { "foo int STATIC" }
  end

end # describe CQLBuilder::Clauses::Column
