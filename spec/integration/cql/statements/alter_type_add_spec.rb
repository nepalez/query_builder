# encoding: utf-8

describe "ALTER TYPE ... ADD" do

  let(:type) { QueryBuilder::CQL.keyspace(:wildlife).type(:species) }

  it_behaves_like :query_builder do
    subject { type.add(:weight, :int) }

    let(:cql) { "ALTER TYPE wildlife.species ADD weight int;" }
  end

end # describe ALTER TYPE ... ADD
