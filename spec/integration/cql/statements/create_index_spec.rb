# encoding: utf-8

describe QueryBuilder::CQL, ".create_index" do

  include QueryBuilder::CQL::Operators

  let(:statement) { described_class.create_index(:foo).on(:bar) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE INDEX foo ON bar ();" }
  end

  it_behaves_like :query_builder do
    subject   { described_class.create_index.on(:bar) }
    let(:cql) { "CREATE CUSTOM INDEX ON bar ();" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists }
    let(:cql) { "CREATE INDEX IF NOT EXISTS foo ON bar ();" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:baz) }
    let(:cql) { "CREATE INDEX foo ON baz.bar ();" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using("path.to.the.IndexClass") }
    let(:cql) { "CREATE INDEX foo ON bar () USING 'path.to.the.IndexClass';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.columns([:id, :priority], :state) }
    let(:cql) { "CREATE INDEX foo ON bar ((id, priority), state);" }
  end

  it_behaves_like :query_builder do
    subject   { statement.columns(cql_keys[:state]) }
    let(:cql) { "CREATE INDEX foo ON bar (KEYS(state));" }
  end

  it_behaves_like :query_builder do
    subject   { statement.columns(cql_entries[:state]) }
    let(:cql) { "CREATE INDEX foo ON bar (ENTRIES(state));" }
  end

  it_behaves_like :query_builder do
    subject   { statement.columns(cql_full[:state]) }
    let(:cql) { "CREATE INDEX foo ON bar (FULL(state));" }
  end

  it_behaves_like :query_builder do
    subject   { statement.with(storage: "/mnt/ssd/indexes/") }
    let(:cql) { "CREATE INDEX foo ON bar () WITH options = {'storage': '/mnt/ssd/indexes/'};" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .if_not_exists
        .use(:baz)
        .columns([:id, :priority], :state)
        .using("path.to.the.IndexClass")
        .with(storage: "/mnt/ssd/indexes/")
    end

    let(:cql) { "CREATE INDEX IF NOT EXISTS foo ON baz.bar ((id, priority), state) USING 'path.to.the.IndexClass' WITH options = {'storage': '/mnt/ssd/indexes/'};" }
  end

  it_behaves_like :query_builder do
    subject do
      described_class.create_index.on(:bar)
        .if_not_exists
        .use(:baz)
        .columns([:id, :priority], :state)
        .using("path.to.the.IndexClass")
        .with(storage: "/mnt/ssd/indexes/")
    end

    let(:cql) { "CREATE CUSTOM INDEX IF NOT EXISTS ON baz.bar ((id, priority), state) USING 'path.to.the.IndexClass' WITH options = {'storage': '/mnt/ssd/indexes/'};" }
  end

end # describe QueryBuilder::CQL.create_index
