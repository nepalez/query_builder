# encoding: utf-8

describe "UPDATE" do

  include QueryBuilder::CQL::Operators

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject do
      table
        .update
        .update(name: :tiger, weight: 300)
        .update(size: 3)
        .where(id: 1, name: [:tiger, :bear])
        .if_exists
        .if(name: :tiger)
        .using(ttl: 100, timestamp: 300)
    end

    let(:cql) { "UPDATE wildlife.species USING TIMESTAMP 300 AND TTL 100 SET name = 'tiger', weight = 300, size = 3 WHERE id = 1 AND name IN ('tiger', 'bear') IF EXISTS AND name = 'tiger';" }
  end

end # describe UPDATE
