# encoding: utf-8

describe "DROP FUNCTION" do

  let(:function) do
    QueryBuilder::CQL.keyspace(:wildlife).function(:count_species)
  end

  let(:statement) { function.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP FUNCTION wildlife.count_species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DROP FUNCTION IF EXISTS wildlife.count_species;" }
  end

end # describe DROP FUNCTION
