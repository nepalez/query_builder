# encoding: utf-8

describe "REVOKE" do

  let(:root)     { QueryBuilder::CQL }
  let(:keyspace) { root.keyspace(:wildlife) }
  let(:table)    { keyspace.table(:species) }

  it_behaves_like :query_builder do
    subject { root.permission.revoke_from(:admin) }
    let(:cql) { "REVOKE ALL PERMISSIONS ON ALL KEYSPACES FROM admin;" }
  end

  it_behaves_like :query_builder do
    subject { root.permission(:alter).revoke_from(:admin) }
    let(:cql) { "REVOKE ALTER PERMISSION ON ALL KEYSPACES FROM admin;" }
  end

  it_behaves_like :query_builder do
    subject { keyspace.permission(:create).revoke_from(:admin) }
    let(:cql) { "REVOKE CREATE PERMISSION ON KEYSPACE wildlife FROM admin;" }
  end

  it_behaves_like :query_builder do
    subject { table.permission(:drop).revoke_from(:admin) }
    let(:cql) { "REVOKE DROP PERMISSION ON TABLE wildlife.species FROM admin;" }
  end

end # describe REVOKE
