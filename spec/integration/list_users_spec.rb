# encoding: utf-8

describe "LIST USERS" do

  let(:statement) { QueryBuilder::CQL.users }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "LIST USERS;" }
  end

end # describe LIST USERS
