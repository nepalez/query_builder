# encoding: utf-8

describe "ALTER TYPE ... ADD" do

  let(:field) do
    QueryBuilder::CQL.keyspace(:wildlife).type(:species).field(:weight)
  end

  it_behaves_like :query_builder do
    subject { field.create(:int) }

    let(:cql) { "ALTER TYPE wildlife.species ADD weight int;" }
  end

end # describe ALTER TYPE ... ADD
