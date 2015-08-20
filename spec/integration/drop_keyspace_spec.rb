# encoding: utf-8

describe "DROP KEYSPACE" do

  let(:keyspace)  { QueryBuilder::CQL.keyspace(:wildlife) }
  let(:statement) { keyspace.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP KEYSPACE wildlife;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP KEYSPACE IF EXISTS wildlife;" }
  end

end # describe DROP KEYSPACE
