# encoding: utf-8

describe "GRANT" do

  let(:root)     { QueryBuilder::CQL }
  let(:keyspace) { root.keyspace(:wildlife) }
  let(:table)    { keyspace.table(:species) }

  it_behaves_like :query_builder do
    subject { root.permission.grant_to(:admin) }
    let(:cql) { "GRANT ALL PERMISSIONS ON ALL KEYSPACES TO admin;" }
  end

  it_behaves_like :query_builder do
    subject { root.permission(:alter).grant_to(:admin) }
    let(:cql) { "GRANT ALTER PERMISSION ON ALL KEYSPACES TO admin;" }
  end

  it_behaves_like :query_builder do
    subject { keyspace.permission(:create).grant_to(:admin) }
    let(:cql) { "GRANT CREATE PERMISSION ON KEYSPACE wildlife TO admin;" }
  end

  it_behaves_like :query_builder do
    subject { table.permission(:drop).grant_to(:admin) }
    let(:cql) { "GRANT DROP PERMISSION ON TABLE wildlife.species TO admin;" }
  end

end # describe GRANT
