# encoding: utf-8

describe "LIST ROLES" do

  let(:statement) { QueryBuilder::CQL.roles }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "LIST ROLES;" }
  end

end # describe LIST ROLES
