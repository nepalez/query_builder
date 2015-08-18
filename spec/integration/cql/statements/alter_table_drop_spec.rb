# encoding: utf-8

describe "ALTER TABLE ... DROP" do

  let(:column) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).column(:weight)
  end

  it_behaves_like :query_builder do
    subject { column.drop }

    let(:cql) { "ALTER TABLE wildlife.species DROP weight;" }
  end

end # describe ALTER TABLE ... DROP
