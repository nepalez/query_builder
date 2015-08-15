# encoding: utf-8

describe CQLBuilder, ".drop_index" do

  let(:statement) { CQLBuilder.drop_index(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "DROP INDEX foo;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "DROP INDEX baz.foo;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP INDEX IF EXISTS foo;" }
  end

end # describe CQLBuilder.drop_index
