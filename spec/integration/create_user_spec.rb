# encoding: utf-8

describe CQLBuilder, ".create_user" do

  let(:statement) { CQLBuilder.create_user(:foo) }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "CREATE USER foo;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.if_not_exists.if_not_exists }
    let(:cql) { "CREATE USER IF NOT EXISTS foo;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.with_password(:bar).with_password(:baz) }
    let(:cql) { "CREATE USER foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :a_statement do
    subject   { statement.superuser(false).superuser }
    let(:cql) { "CREATE USER foo SUPERUSER;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.superuser.superuser(false) }
    let(:cql) { "CREATE USER foo NOSUPERUSER;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.with_password(:bar).superuser.if_not_exists }
    let(:cql) { "CREATE USER IF NOT EXISTS foo WITH PASSWORD 'bar' SUPERUSER;" }
  end

end # describe CQLBuilder.create_user
