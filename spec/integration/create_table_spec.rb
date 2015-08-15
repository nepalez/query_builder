# encoding: utf-8

describe CQLBuilder, ".create_table" do

  include CQLBuilder::Operators

  let(:statement) { CQLBuilder.create_table(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "CREATE TABLE foo ();" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.use(:bar) }
    let(:cql) { "CREATE TABLE bar.foo ();" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .column(:bar, cql_frozen[:int])
        .column(:baz, :text, static: true)
    end

    let(:cql) { "CREATE TABLE foo (bar FROZEN <int>, baz text STATIC);" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .column(:bar, :int)
        .primary_key(cql_composite[:bar, :baz], :qux)
    end

    let(:cql) { "CREATE TABLE foo (bar int, PRIMARY KEY ((bar, baz), qux));" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.if_not_exists }
    let(:cql) { "CREATE TABLE IF NOT EXISTS foo ();" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement.with(
        compression: { sstable_compression: :DeflateCompressor },
        compaction:  { class: :SizeTieredCompactionStrategy, min_threshold: 6 }
      )
    end

    let(:cql) { "CREATE TABLE foo () WITH compression = {'sstable_compression': 'DeflateCompressor'} AND compaction = {'class': 'SizeTieredCompactionStrategy', 'min_threshold': 6};" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .with(compression: { sstable_compression: :DeflateCompressor })
        .with(compaction: { class: :SizeTieredCompactionStrategy, min_threshold: 6 })
    end

    let(:cql) { "CREATE TABLE foo () WITH compression = {'sstable_compression': 'DeflateCompressor'} AND compaction = {'class': 'SizeTieredCompactionStrategy', 'min_threshold': 6};" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.clustering_order(:bar) }
    let(:cql) { "CREATE TABLE foo () WITH CLUSTERING ORDER BY (bar ASC);" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.clustering_order(:bar, :desc) }
    let(:cql) { "CREATE TABLE foo () WITH CLUSTERING ORDER BY (bar DESC);" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.compact_storage }
    let(:cql) { "CREATE TABLE foo () WITH COMPACT STORAGE;" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .with(read_repair_chance: 1.0)
        .compact_storage
        .clustering_order(:bar, :desc)
    end

    let(:cql) { "CREATE TABLE foo () WITH read_repair_chance = 1.0 AND COMPACT STORAGE AND CLUSTERING ORDER BY (bar DESC);" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .use(:bar)
        .if_not_exists
        .column(:bar, cql_frozen[:int])
        .column(:baz, :text, static: true)
        .column(:qux, :varchar)
        .primary_key(cql_composite[:bar, :baz], :qux)
        .with(read_repair_chance: 1.0)
        .with(comment: "Important records")
        .compact_storage
        .clustering_order(:bar, :desc)
    end

    let(:cql) { "CREATE TABLE IF NOT EXISTS bar.foo (bar FROZEN <int>, baz text STATIC, qux varchar, PRIMARY KEY ((bar, baz), qux)) WITH read_repair_chance = 1.0 AND comment = 'Important records' AND COMPACT STORAGE AND CLUSTERING ORDER BY (bar DESC);" }
  end

end # describe CQLBuilder.create_table
