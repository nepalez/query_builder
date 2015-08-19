# encoding: utf-8

describe "ALTER TYPE ... RENAME" do

  let(:field) do
    QueryBuilder::CQL.keyspace(:wildlife).type(:species).field(:weight)
  end

  it_behaves_like :query_builder do
    subject { field.rename(:body_weight) }

    let(:cql) { "ALTER TYPE wildlife.species RENAME weight TO body_weight;" }
  end

end # describe ALTER TYPE ... RENAME
