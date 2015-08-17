# encoding: utf-8

describe "DROP ROLE" do

  let(:role)      { QueryBuilder::CQL.role(:admin) }
  let(:statement) { role.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP ROLE admin;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DROP ROLE IF EXISTS admin;" }
  end

end # describe DROP ROLE
