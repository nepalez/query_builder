# encoding: utf-8

describe CQLBuilder, ".list_users" do

  let(:statement) { CQLBuilder.list_users }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "LIST USERS;" }
  end

end # describe CQLBuilder.list_users
