# encoding: utf-8

describe CQLBuilder::Clauses::Using do

  subject { described_class.new(args) }

  let(:args) { { value: "foo.bar.baz" } }

  it_behaves_like :a_clause, :using

  it_behaves_like :cql_builder do
    let(:cql) { "'foo.bar.baz'" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { property: :ttl, value: 100 } }
    let(:cql)  { "TTL 100" }
  end

end # describe CQLBuilder::Clauses::Using
