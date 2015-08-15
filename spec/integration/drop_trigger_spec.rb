# encoding: utf-8

describe CQLBuilder, ".drop_trigger" do

  let(:statement) { CQLBuilder.drop_trigger(:myTrigger) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "DROP TRIGGER myTrigger;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.on(:foo) }
    let(:cql) { "DROP TRIGGER myTrigger ON foo;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TRIGGER IF EXISTS myTrigger;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.on(:foo).if_exists }
    let(:cql) { "DROP TRIGGER IF EXISTS myTrigger ON foo;" }
  end

end # describe CQLBuilder.drop_trigger
