# encoding: utf-8

describe CQLBuilder, ".alter_user" do

  let(:statement) { CQLBuilder.alter_user(:foo, :baz) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.superuser }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz' SUPERUSER;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.superuser(false) }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz' NOSUPERUSER;" }
  end

end # describe CQLBuilder.alter_user
