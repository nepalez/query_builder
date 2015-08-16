# encoding: utf-8

describe QueryBuilder::CQL, ".drop_trigger" do

  let(:statement) { described_class.drop_trigger(:myTrigger) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TRIGGER myTrigger;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.on(:foo) }
    let(:cql) { "DROP TRIGGER myTrigger ON foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TRIGGER IF EXISTS myTrigger;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.on(:foo).if_exists }
    let(:cql) { "DROP TRIGGER IF EXISTS myTrigger ON foo;" }
  end

end # describe QueryBuilder::CQL.drop_trigger
