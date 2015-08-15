# encoding: utf-8

describe CQLBuilder, ".list_users" do

  let(:statement) { CQLBuilder.list_users }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "LIST USERS;" }
  end

end # describe CQLBuilder.list_users
