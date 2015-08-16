# encoding: utf-8

describe QueryBuilder::CQL, ".drop_keyspace" do

  let(:statement) { described_class.drop_keyspace(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP KEYSPACE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP KEYSPACE IF EXISTS foo;" }
  end

end # describe QueryBuilder::CQL.drop_keyspace
