# encoding: utf-8

describe "INSERT" do

  include QueryBuilder::CQL::Operators

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject do
      table
        .insert
        .insert(names: ["tiger", "pantera tigra"])
        .insert(sizes: { length: 3 })
        .if_not_exists
        .using(ttl: 500)
        .using(timestamp: 100)
    end

    let(:cql) { "INSERT INTO wildlife.species (names, sizes) VALUES (['tiger', 'pantera tigra'], {'length': 3}) USING TIMESTAMP 100 AND TTL 500 IF NOT EXISTS;" }
  end

  context 'when different columns have the same value' do
    it_behaves_like :query_builder do
      let(:now) { Time.now }
      subject { table.insert(created_at: now, updated_at: now) }
      let(:cql) { "INSERT INTO wildlife.species (created_at, updated_at) VALUES ('#{now}', '#{now}');" }
    end
  end

end # describe INSERT
