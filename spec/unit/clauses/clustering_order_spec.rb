# encoding: utf-8

describe CQLBuilder::Clauses::ClusteringOrder do

  subject    { described_class.new(args) }
  let(:args) { { name: :foo } }

  it_behaves_like :a_clause, :with

  it_behaves_like :cql_builder do
    let(:cql) { "CLUSTERING ORDER BY (foo ASC)" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { name: :foo, desc: true } }
    let(:cql)  { "CLUSTERING ORDER BY (foo DESC)" }
  end

end # describe CQLBuilder::Clauses::ClusteringOrder
