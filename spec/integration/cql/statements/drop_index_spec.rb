# encoding: utf-8

describe "DROP INDEX" do

  let(:index) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).index(:priority_index)
  end

  let(:statement) { index.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP INDEX wildlife.priority_index;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DROP INDEX IF EXISTS wildlife.priority_index;" }
  end

end # describe DROP INDEX
