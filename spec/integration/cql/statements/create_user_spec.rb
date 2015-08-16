# encoding: utf-8

describe QueryBuilder::CQL, ".create_user" do

  let(:statement) { described_class.create_user(:foo, :baz) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE USER foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists.if_not_exists }
    let(:cql) { "CREATE USER IF NOT EXISTS foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser(false).superuser }
    let(:cql) { "CREATE USER foo WITH PASSWORD 'baz' SUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser.superuser(false) }
    let(:cql) { "CREATE USER foo WITH PASSWORD 'baz' NOSUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser.if_not_exists }
    let(:cql) { "CREATE USER IF NOT EXISTS foo WITH PASSWORD 'baz' SUPERUSER;" }
  end

end # describe QueryBuilder::CQL.create_user
