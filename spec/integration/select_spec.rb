# encoding: utf-8

describe "SELECT" do

  include QueryBuilder::CQL::Operators

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject   { table.select }
    let(:cql) { "SELECT * FROM wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { table.select.count }
    let(:cql) { "SELECT COUNT(*) FROM wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { table.select.count(1) }
    let(:cql) { "SELECT COUNT(1) FROM wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject   { table.select.where_clustered(name: :tiger, family: :cat) }
    let(:cql) { "SELECT * FROM wildlife.species WHERE (name, family) = ('tiger', 'cat');" }
  end

  it_behaves_like :query_builder do
    subject do
      table
        .select(id: :uuid)
        .select(:name)
        .order(:name, :desc)
        .distinct
        .where(id: cql_gte(3))
        .where(id: cql_lt(10), area: cql_in("park", "garden"))
        .where(cql_element[:names, 1] => :cat)
        .limit(10)
        .allow_filtering
    end

    let(:cql) { "SELECT DISTINCT uuid AS id, name FROM wildlife.species WHERE id >= 3 AND id < 10 AND area IN ('park', 'garden') AND names[1] = 'cat' ORDER BY name DESC LIMIT 10 ALLOW FILTERING;" }

  end

  it_behaves_like :query_builder do
    subject do
      table
        .select
        .where(uuid: cql_lt(cql_mintimeuuid("2013-02-02 10:00+0000")))
    end

    let(:cql) { "SELECT * FROM wildlife.species WHERE uuid < MINTIMEUUID('2013-02-02 10:00+0000');" }
  end

end # describe SELECT
