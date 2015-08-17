# encoding: utf-8

describe QueryBuilder::CQL, ".drop_function" do

  let(:statement) { described_class.drop_function(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP FUNCTION foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar) }
    let(:cql) { "DROP FUNCTION bar.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP FUNCTION IF EXISTS foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar).if_exists }
    let(:cql) { "DROP FUNCTION IF EXISTS bar.foo;" }
  end

end # describe QueryBuilder::CQL.drop_function
