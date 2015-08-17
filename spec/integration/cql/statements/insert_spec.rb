# encoding: utf-8

describe QueryBuilder::CQL, ".insert_into" do

  include QueryBuilder::CQL::Operators

  let(:statement) { described_class.insert_into(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "INSERT INTO foo () VALUES ();" }
  end

  it_behaves_like :query_builder do
    subject   { statement.set(bar: [:one, :two], baz: { qux: 3 }) }
    let(:cql) { "INSERT INTO foo (bar, baz) VALUES (['one', 'two'], {'qux': 3});" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar) }
    let(:cql) { "INSERT INTO bar.foo () VALUES ();" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using(ttl: 500, timestamp: 100) }
    let(:cql) { "INSERT INTO foo () VALUES () USING TTL 500 AND TIMESTAMP 100;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists }
    let(:cql) { "INSERT INTO foo () VALUES () IF NOT EXISTS;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .use(:bar)
        .if_not_exists
        .using(ttl: 500)
        .using(timestamp: 100)
        .set(bar: [:one, :two])
        .set(baz: { qux: 3 })
    end

    let(:cql) { "INSERT INTO bar.foo (bar, baz) VALUES (['one', 'two'], {'qux': 3}) USING TTL 500 AND TIMESTAMP 100 IF NOT EXISTS;" }
  end

end # describe QueryBuilder::CQL.insert_into
