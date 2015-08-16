# encoding: utf-8

describe QueryBuilder::CQL, ".update" do

  include QueryBuilder::CQL::Operators

  let(:statement) { described_class.update(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "UPDATE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:abc) }
    let(:cql) { "UPDATE abc.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.set(bar: :baz, qux: 3) }
    let(:cql) { "UPDATE foo SET bar = 'baz', qux = 3;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.set(bar: :baz).set(qux: 3) }
    let(:cql) { "UPDATE foo SET bar = 'baz', qux = 3;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.set(bar: cql_inc(3)) }
    let(:cql) { "UPDATE foo SET bar = bar + 3;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using(ttl: 100, timestamp: 300) }
    let(:cql) { "UPDATE foo USING TTL 100 AND TIMESTAMP 300;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using(ttl: 100).using(timestamp: 300) }
    let(:cql) { "UPDATE foo USING TTL 100 AND TIMESTAMP 300;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.where(foo: :bar, bar: cql_in(:one, :two)) }
    let(:cql) { "UPDATE foo WHERE foo = 'bar' AND bar IN ('one', 'two');" }
  end

  it_behaves_like :query_builder do
    subject   { statement.where(foo: :bar, bar: [:one, :two]) }
    let(:cql) { "UPDATE foo WHERE foo = 'bar' AND bar IN ('one', 'two');" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if(bar: :baz) }
    let(:cql) { "UPDATE foo IF bar = 'baz';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "UPDATE foo IF EXISTS;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .use(:abc)
        .where(foo: :bar, bar: [:one, :two])
        .set(bar: :baz, qux: 3)
        .if_exists
        .if(baz: 4)
        .using(ttl: 100, timestamp: 300)
    end

    let(:cql) { "UPDATE abc.foo USING TTL 100 AND TIMESTAMP 300 SET bar = 'baz', qux = 3 WHERE foo = 'bar' AND bar IN ('one', 'two') IF EXISTS AND baz = 4;" }
  end

end # describe QueryBuilder::CQL.update
