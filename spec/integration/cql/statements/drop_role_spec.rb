# encoding: utf-8

describe QueryBuilder::CQL, ".drop_role" do

  let(:statement) { described_class.drop_role(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP ROLE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP ROLE IF EXISTS foo;" }
  end

end # describe QueryBuilder::CQL.drop_role
