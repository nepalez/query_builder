# encoding: utf-8

describe QueryBuilder::CQL, ".create_keyspace" do

  let(:statement) { described_class.create_keyspace(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE KEYSPACE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists.if_not_exists }
    let(:cql) { "CREATE KEYSPACE IF NOT EXISTS foo;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    let(:cql) { "CREATE KEYSPACE foo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3} AND durable_writes = false;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.with(durable_writes: false).if_not_exists }
    let(:cql) { "CREATE KEYSPACE IF NOT EXISTS foo WITH durable_writes = false;" }
  end

end # describe QueryBuilder::CQL.create_keyspace
