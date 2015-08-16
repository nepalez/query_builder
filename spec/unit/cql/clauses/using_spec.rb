# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Using do

  subject { described_class.new(args) }

  let(:args) { { value: "foo.bar.baz" } }

  it_behaves_like :a_clause, :using

  it_behaves_like :query_builder do
    let(:cql) { "'foo.bar.baz'" }
  end

  it_behaves_like :query_builder do
    let(:args) { { property: :ttl, value: 100 } }
    let(:cql)  { "TTL 100" }
  end

end # describe QueryBuilder::CQL::Clauses::Using
