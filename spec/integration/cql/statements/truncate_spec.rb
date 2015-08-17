# encoding: utf-8

describe "TRUNCATE" do

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject   { table.truncate }
    let(:cql) { "TRUNCATE wildlife.species;" }
  end

end # describe TRUNCATE
