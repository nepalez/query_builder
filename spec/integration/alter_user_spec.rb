# encoding: utf-8

describe CQLBuilder, ".alter_user" do

  let(:statement) { CQLBuilder.alter_user(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "ALTER USER foo;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.with_password(:bar).with_password(:baz) }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.superuser }
    let(:cql) { "ALTER USER foo SUPERUSER;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.superuser.superuser(false) }
    let(:cql) { "ALTER USER foo NOSUPERUSER;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.with_password(:bar).superuser }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'bar' SUPERUSER;" }
  end

end # describe CQLBuilder.alter_user
