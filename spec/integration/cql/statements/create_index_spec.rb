# encoding: utf-8

describe "CREATE INDEX" do

  include QueryBuilder::CQL::Operators

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject do
      table.index(:my_index)
        .create([:id, :priority])
        .add(:state)
        .if_not_exists
        .using("path.to.the.IndexClass")
        .with(storage: "/mnt/ssd/indexes/")
    end

    let(:cql) { "CREATE INDEX IF NOT EXISTS my_index ON wildlife.species ((id, priority), state) USING 'path.to.the.IndexClass' WITH options = {'storage': '/mnt/ssd/indexes/'};" }
  end

  it_behaves_like :query_builder do
    subject do
      table.index
        .create([:id, :priority])
        .add(:state)
        .if_not_exists
        .using("path.to.the.IndexClass")
        .with(storage: "/mnt/ssd/indexes/")
    end

    let(:cql) { "CREATE CUSTOM INDEX IF NOT EXISTS ON wildlife.species ((id, priority), state) USING 'path.to.the.IndexClass' WITH options = {'storage': '/mnt/ssd/indexes/'};" }
  end

end # describe CREATE INDEX
