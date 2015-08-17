# encoding: utf-8

describe "CREATE TYPE" do

  include QueryBuilder::CQL::Operators

  let(:type)      { QueryBuilder::CQL.keyspace(:wildlife).type(:species) }
  let(:statement) { type.create }

  it_behaves_like :query_builder do
    subject do
      statement
        .if_not_exists
        .field(:name, :text)
        .field(:params, cql_map[:text, :text])
    end

    let(:cql) { "CREATE TYPE IF NOT EXISTS wildlife.species (name text, params MAP<text, text>);" }
  end

end # describe CREATE TYPE
