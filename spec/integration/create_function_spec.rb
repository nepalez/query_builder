# encoding: utf-8

describe "CREATE FUNCTION" do

  let(:function) do
    QueryBuilder::CQL.keyspace(:wildlife).function(:count_species)
  end

  let(:statement) { function.create(:java, "return MyClass.count(input));") }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE FUNCTION wildlife.count_species () RETURNS NULL ON NULL INPUT LANGUAGE 'java' AS 'return MyClass.count(input));';" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .or_replace
        .if_not_exists
        .argument(:input, :double)
        .returns(:int)
        .called_on_null
    end

    let(:cql) { "CREATE OR REPLACE FUNCTION IF NOT EXISTS wildlife.count_species (input double) CALLED ON NULL INPUT RETURNS int LANGUAGE 'java' AS 'return MyClass.count(input));';" }
  end

end # describe CREATE FUNCTION
