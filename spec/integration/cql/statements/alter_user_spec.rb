# encoding: utf-8

describe QueryBuilder::CQL, ".alter_user" do

  let(:statement) { described_class.alter_user(:foo, :baz) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz' SUPERUSER;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.superuser(false) }
    let(:cql) { "ALTER USER foo WITH PASSWORD 'baz' NOSUPERUSER;" }
  end

end # describe QueryBuilder::CQL.alter_user
