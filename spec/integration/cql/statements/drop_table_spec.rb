# encoding: utf-8

describe "DROP TABLE" do

  let(:table)     { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }
  let(:statement) { table.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TABLE wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TABLE IF EXISTS wildlife.species;" }
  end

end # describe DROP TABLE
