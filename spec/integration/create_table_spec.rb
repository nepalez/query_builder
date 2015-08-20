# encoding: utf-8

describe "CREATE TABLE" do

  include QueryBuilder::CQL::Operators

  let(:table)     { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }
  let(:statement) { table.create }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE TABLE wildlife.species ();" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .if_not_exists
        .add(:id, :int)
        .add(:priority, :int)
        .add(:name, :text)
        .add(:known_from, cql_frozen[:int])
        .add(:review, :timestamp, static: true)
        .primary_key(cql_composite[:id, :priority], :name)
        .with(read_repair_chance: 1.0)
        .with(comment: "Important records")
        .compact_storage
        .clustering_order(:name, :desc)
    end

    let(:cql) { "CREATE TABLE IF NOT EXISTS wildlife.species (id int, priority int, name text, known_from FROZEN <int>, review timestamp STATIC, PRIMARY KEY ((id, priority), name)) WITH read_repair_chance = 1.0 AND comment = 'Important records' AND COMPACT STORAGE AND CLUSTERING ORDER BY (name DESC);" }
  end

end # describe CREATE TABLE
