# encoding: utf-8

describe "CREATE USER" do

  let(:user)      { QueryBuilder::CQL.user(:andrew) }
  let(:statement) { user.create(:foobar) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE USER andrew WITH PASSWORD 'foobar';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser(false) }
    let(:cql) { "CREATE USER andrew WITH PASSWORD 'foobar' NOSUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser.if_not_exists }
    let(:cql) { "CREATE USER IF NOT EXISTS andrew WITH PASSWORD 'foobar' SUPERUSER;" }
  end

end # describe QueryBuilder::CQL.create_user
