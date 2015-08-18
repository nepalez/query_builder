# encoding: utf-8

describe "ALTER TABLE ... ALTER" do

  let(:column) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).column(:weight)
  end

  it_behaves_like :query_builder do
    subject { column.alter(:int) }

    let(:cql) { "ALTER TABLE wildlife.species ALTER weight TYPE int;" }
  end

end # describe ALTER TABLE ... ALTER
