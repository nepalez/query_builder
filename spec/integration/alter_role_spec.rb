# encoding: utf-8

describe "ALTER ROLE" do

  let(:role)      { QueryBuilder::CQL.role(:admin) }
  let(:statement) { role.alter("123456") }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "ALTER ROLE admin WITH PASSWORD '123456';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.password(:foobar) }
    let(:cql) { "ALTER ROLE admin WITH PASSWORD 'foobar';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser }
    let(:cql) { "ALTER ROLE admin WITH PASSWORD '123456' SUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser(false) }
    let(:cql) { "ALTER ROLE admin WITH PASSWORD '123456' NOSUPERUSER;" }
  end

end # describe ALTER ROLE
