# encoding: utf-8

describe "ALTER TABLE ... RENAME" do

  let(:column) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).column(:weight)
  end

  it_behaves_like :query_builder do
    subject { column.rename(:body_weight) }

    let(:cql) { "ALTER TABLE wildlife.species RENAME weight TO body_weight;" }
  end

end # describe ALTER TABLE ... RENAME
