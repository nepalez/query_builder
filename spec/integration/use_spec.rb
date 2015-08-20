# encoding: utf-8

describe "USE" do

  let(:keyspace) { QueryBuilder::CQL.keyspace(:wildlife) }

  it_behaves_like :query_builder do
    subject   { keyspace.use }
    let(:cql) { "USE wildlife;" }
  end

end # describe USE
