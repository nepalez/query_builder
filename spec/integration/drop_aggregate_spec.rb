# encoding: utf-8

describe "DROP AGGREGATE" do

  let(:aggregate) do
    QueryBuilder::CQL.keyspace(:wildlife).aggregate(:numAverage)
  end

  let(:statement) { aggregate.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP AGGREGATE wildlife.numAverage;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DROP AGGREGATE IF EXISTS wildlife.numAverage;" }
  end

end # describe DROP AGGREGATE
