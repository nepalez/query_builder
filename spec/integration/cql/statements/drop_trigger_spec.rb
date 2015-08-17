# encoding: utf-8

describe "DROP TRIGGER" do

  let(:trigger) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).trigger(:alert)
  end

  let(:statement) { trigger.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TRIGGER alert ON wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DROP TRIGGER IF EXISTS alert ON wildlife.species;" }
  end

end # describe DROP TRIGGER
