# encoding: utf-8

describe QueryBuilder::CQL, ".drop_index" do

  let(:statement) { described_class.drop_index(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP INDEX foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "DROP INDEX baz.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP INDEX IF EXISTS foo;" }
  end

end # describe QueryBuilder::CQL.drop_index
