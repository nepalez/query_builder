# encoding: utf-8

describe "DROP USER" do

  let(:user)      { QueryBuilder::CQL.user(:andrew) }
  let(:statement) { user.drop }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DROP USER andrew;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP USER IF EXISTS andrew;" }
  end

end # describe DROP USER
