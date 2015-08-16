# encoding: utf-8

describe QueryBuilder::CQL, ".drop_table" do

  let(:statement) { described_class.drop_table(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TABLE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "DROP TABLE baz.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TABLE IF EXISTS foo;" }
  end

end # describe QueryBuilder::CQL.drop_table
