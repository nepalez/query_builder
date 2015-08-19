# encoding: utf-8

describe "ALTER TYPE ... ALTER" do

  let(:field) do
    QueryBuilder::CQL.keyspace(:wildlife).type(:species).field(:weight)
  end

  it_behaves_like :query_builder do
    subject { field.alter(:int) }

    let(:cql) { "ALTER TYPE wildlife.species ALTER weight TYPE int;" }
  end

end # describe ALTER TYPE ... ALTER
