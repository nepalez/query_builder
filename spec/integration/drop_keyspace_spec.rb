# encoding: utf-8

describe CQLBuilder, ".drop_keyspace" do

  let(:statement) { CQLBuilder.drop_keyspace(:foo) }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "DROP KEYSPACE \"foo\";" }
  end

  it_behaves_like :a_statement do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP KEYSPACE IF EXISTS \"foo\";" }
  end

end # describe CQLBuilder.drop_keyspace
