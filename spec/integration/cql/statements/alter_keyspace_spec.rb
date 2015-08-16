# encoding: utf-8

describe QueryBuilder::CQL, ".alter_keyspace" do

  let(:statement) { described_class.alter_keyspace(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "ALTER KEYSPACE foo;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    let(:cql) { "ALTER KEYSPACE foo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3} AND durable_writes = false;" }
  end

end # describe QueryBuilder::CQL.alter_keyspace
