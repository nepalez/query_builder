# encoding: utf-8

describe "CREATE KEYSPACE" do

  let(:keyspace)  { QueryBuilder::CQL.keyspace(:wildlife) }
  let(:statement) { keyspace.create }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE KEYSPACE wildlife;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .if_not_exists
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    let(:cql) { "CREATE KEYSPACE IF NOT EXISTS wildlife WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3} AND durable_writes = false;" }
  end

end # describe CREATE KEYSPACE
