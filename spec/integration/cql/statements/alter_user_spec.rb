# encoding: utf-8

describe "ALTER USER" do

  let(:user)      { QueryBuilder::CQL.user(:andrew) }
  let(:statement) { user.alter("123456") }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "ALTER USER andrew WITH PASSWORD '123456';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.password(:foobar) }
    let(:cql) { "ALTER USER andrew WITH PASSWORD 'foobar';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser }
    let(:cql) { "ALTER USER andrew WITH PASSWORD '123456' SUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser(false) }
    let(:cql) { "ALTER USER andrew WITH PASSWORD '123456' NOSUPERUSER;" }
  end

end # describe ALTER USER
