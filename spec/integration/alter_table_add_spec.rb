# encoding: utf-8

describe "ALTER TABLE ... ADD" do

  let(:column) do
    QueryBuilder::CQL.keyspace(:wildlife).table(:species).column(:weight)
  end

  it_behaves_like :query_builder do
    subject { column.create(:int) }

    let(:cql) { "ALTER TABLE wildlife.species ADD weight int;" }
  end

  it_behaves_like :query_builder do
    subject { column.create(:int, static: true) }

    let(:cql) { "ALTER TABLE wildlife.species ADD weight int STATIC;" }
  end

end # describe ALTER TABLE ... ADD
