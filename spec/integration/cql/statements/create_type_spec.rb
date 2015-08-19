# encoding: utf-8

describe "CREATE TYPE" do

  include QueryBuilder::CQL::Operators

  let(:type) { QueryBuilder::CQL.keyspace(:wildlife).type(:species) }

  it_behaves_like :query_builder do
    subject do
      type.create
        .add(:name, :text)
        .add(:params, cql_map[:text, :text])
        .if_not_exists
    end

    let(:cql) { "CREATE TYPE IF NOT EXISTS wildlife.species (name text, params MAP<text, text>);" }
  end

end # describe CREATE TYPE
