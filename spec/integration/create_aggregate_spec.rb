# encoding: utf-8

describe "CREATE AGGREGATE" do

  let(:aggregate) do
    QueryBuilder::CQL.keyspace(:wildlife).aggregate(:numAverage)
  end

  let(:statement) { aggregate.create }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE AGGREGATE wildlife.numAverage ();" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .or_replace
        .if_not_exists
        .argument(:input, :int)
        .sfunc(:avgState)
        .stype(:bigint)
        .finalfunc(:avgFinal)
        .initcond(0, 0)
    end

    let(:cql) { "CREATE OR REPLACE AGGREGATE IF NOT EXISTS wildlife.numAverage (input int) SFUNC avgState STYPE bigint FINALFUNC avgFinal INITCOND (0, 0);" }
  end

end # describe CREATE AGGREGATE
