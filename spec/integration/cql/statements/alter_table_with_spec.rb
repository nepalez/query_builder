# encoding: utf-8

describe "ALTER TABLE ... WITH" do

  let(:table) { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }

  it_behaves_like :query_builder do
    subject do
      table
        .alter(comment: "A most excellent and useful table")
        .alter(read_repair_chance: 0.2, default_time_to_live: 0)
    end

    let(:cql) { "ALTER TABLE wildlife.species WITH comment = 'A most excellent and useful table' AND read_repair_chance = 0.2 AND default_time_to_live = 0;" }
  end

end # describe ALTER TABLE ... WITH
