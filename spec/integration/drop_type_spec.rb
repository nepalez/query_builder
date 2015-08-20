# encoding: utf-8

describe "DROP TYPE" do

  let(:type)      { QueryBuilder::CQL.keyspace(:wildlife).type(:species) }
  let(:statement) { type.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TYPE wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TYPE IF EXISTS wildlife.species;" }
  end

end # describe DROP TYPE
