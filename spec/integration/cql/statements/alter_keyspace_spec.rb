# encoding: utf-8

describe "ALTER KEYSPACE" do

  let(:statement) { QueryBuilder::CQL.keyspace(:wildlife).alter }

  it_behaves_like :query_builder do
    subject do
      statement
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    let(:cql) { "ALTER KEYSPACE wildlife WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3} AND durable_writes = false;" }
  end

end # describe ALTER KEYSPACE
