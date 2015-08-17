# encoding: utf-8

describe QueryBuilder::CQL, ".drop_aggregate" do

  let(:statement) { described_class.drop_aggregate(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP AGGREGATE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar) }
    let(:cql) { "DROP AGGREGATE bar.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP AGGREGATE IF EXISTS foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar).if_exists }
    let(:cql) { "DROP AGGREGATE IF EXISTS bar.foo;" }
  end

end # describe QueryBuilder::CQL.drop_aggregate
