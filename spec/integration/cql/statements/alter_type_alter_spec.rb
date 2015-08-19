# encoding: utf-8

describe "ALTER TYPE ... ALTER" do

  let(:type) do
    QueryBuilder::CQL.keyspace(:wildlife).type(:species)
  end

  it_behaves_like :query_builder do
    subject { type.alter(:weight, :int) }

    let(:cql) { "ALTER TYPE wildlife.species ALTER weight TYPE int;" }
  end

end # describe ALTER TYPE ... ALTER
