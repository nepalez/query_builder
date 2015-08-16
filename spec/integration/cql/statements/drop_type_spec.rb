# encoding: utf-8

describe QueryBuilder::CQL, ".drop_type" do

  let(:statement) { described_class.drop_type(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP TYPE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TYPE IF EXISTS foo;" }
  end

end # describe QueryBuilder::CQL.drop_type
