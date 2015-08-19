# encoding: utf-8

describe "ALTER TYPE ... RENAME" do

  let(:type) { QueryBuilder::CQL.keyspace(:wildlife).type(:species) }

  it_behaves_like :query_builder do
    subject { type.rename(:weight, :body_weight) }

    let(:cql) { "ALTER TYPE wildlife.species RENAME weight TO body_weight;" }
  end

end # describe ALTER TYPE ... RENAME
