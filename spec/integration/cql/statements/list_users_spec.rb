# encoding: utf-8

describe QueryBuilder::CQL, ".list_users" do

  let(:statement) { described_class.list_users }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "LIST USERS;" }
  end

end # describe QueryBuilder::CQL.list_users
