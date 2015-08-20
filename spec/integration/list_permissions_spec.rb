# encoding: utf-8

describe "LIST" do

  let(:root)     { QueryBuilder::CQL }
  let(:keyspace) { root.keyspace(:wildlife) }
  let(:table)    { keyspace.table(:species) }

  it_behaves_like :query_builder do
    subject { root.permission.of(:admin) }
    let(:cql) { "LIST ALL PERMISSIONS ON ALL KEYSPACES OF admin;" }
  end

  it_behaves_like :query_builder do
    subject { root.permission(:alter).of(:admin) }
    let(:cql) { "LIST ALTER PERMISSION ON ALL KEYSPACES OF admin;" }
  end

  it_behaves_like :query_builder do
    subject { keyspace.permission(:create).of(:admin) }
    let(:cql) { "LIST CREATE PERMISSION ON KEYSPACE wildlife OF admin;" }
  end

  it_behaves_like :query_builder do
    subject { table.permission(:drop).of(:admin) }
    let(:cql) { "LIST DROP PERMISSION ON TABLE wildlife.species OF admin;" }
  end

  it_behaves_like :query_builder do
    subject { table.permission(:drop).of(:admin).norecursive }
    let(:cql) { "LIST DROP PERMISSION ON TABLE wildlife.species OF admin NORECURSIVE;" }
  end

end # describe LIST
