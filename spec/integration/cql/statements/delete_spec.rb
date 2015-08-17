# encoding: utf-8

describe "DELETE" do

  include QueryBuilder::CQL::Operators

  let(:table)     { QueryBuilder::CQL.keyspace(:wildlife).table(:species) }
  let(:statement) { table.delete }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DELETE FROM wildlife.species;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .values(:name, :number)
        .where(name: [:qiwi, :dront], cql_element[:state, 0] => :not_found)
        .if(number: 0)
        .using(timestamp: 100)
        .if_exists
    end

    let(:cql) { "DELETE name, number FROM wildlife.species USING TIMESTAMP 100 WHERE name IN ('qiwi', 'dront') AND state[0] = 'not_found' IF EXISTS AND number = 0;" }
  end

end # describe DELETE
