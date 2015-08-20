# encoding: utf-8

describe "BATCH" do

  let(:root)      { QueryBuilder::CQL }
  let(:keyspace)  { root.keyspace(:wildlife) }
  let(:table)     { keyspace.table(:species) }
  let(:insert)    { table.insert(name: :tiger) }
  let(:delete)    { table.delete(:name).where(name: :tiger) }
  let(:statement) { root.batch.add(delete).add(insert) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "BEGIN BATCH DELETE name FROM wildlife.species WHERE name = 'tiger'; INSERT INTO wildlife.species (name) VALUES ('tiger'); APPLY BATCH;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.unlogged }
    let(:cql) { "BEGIN UNLOGGED BATCH DELETE name FROM wildlife.species WHERE name = 'tiger'; INSERT INTO wildlife.species (name) VALUES ('tiger'); APPLY BATCH;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.counter }
    let(:cql) { "BEGIN COUNTER BATCH DELETE name FROM wildlife.species WHERE name = 'tiger'; INSERT INTO wildlife.species (name) VALUES ('tiger'); APPLY BATCH;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.timestamp(100) }
    let(:cql) { "BEGIN BATCH USING TIMESTAMP 100 DELETE name FROM wildlife.species WHERE name = 'tiger'; INSERT INTO wildlife.species (name) VALUES ('tiger'); APPLY BATCH;" }
  end

end # describe BATCH
