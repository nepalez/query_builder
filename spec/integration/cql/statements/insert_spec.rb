# encoding: utf-8

describe "INSERT" do

  include QueryBuilder::CQL::Operators

  let(:table)     { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }
  let(:statement) { table.insert }

  it_behaves_like :query_builder do
    subject do
      statement
        .if_not_exists
        .using(ttl: 500)
        .using(timestamp: 100)
        .set(names: ["tiger", "pantera tigra"])
        .set(sizes: { length: 3 })
    end

    let(:cql) { "INSERT INTO wildlife.species (names, sizes) VALUES (['tiger', 'pantera tigra'], {'length': 3}) USING TIMESTAMP 100 AND TTL 500 IF NOT EXISTS;" }
  end

end # describe INSERT
