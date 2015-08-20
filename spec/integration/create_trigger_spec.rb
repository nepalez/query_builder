# encoding: utf-8

describe "CREATE TRIGGER" do

  let(:trigger) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).trigger(:alert)
  end

  let(:statement) { trigger.create }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE TRIGGER alert ON wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists.using("wildlife.triggers.alert") }
    let(:cql) { "CREATE TRIGGER IF NOT EXISTS alert ON wildlife.species USING 'wildlife.triggers.alert';" }
  end

end # describe CREATE TRIGGER
