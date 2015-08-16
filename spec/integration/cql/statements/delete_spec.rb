# encoding: utf-8

describe QueryBuilder::CQL, ".delete_from" do

  include QueryBuilder::CQL::Operators

  let(:statement) { described_class.delete_from(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "DELETE FROM foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:abc) }
    let(:cql) { "DELETE FROM abc.foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.values(:bar, :baz).value(:qux) }
    let(:cql) { "DELETE bar, baz, qux FROM foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.values(cql_element[:bar, :baz]) }
    let(:cql) { "DELETE bar['baz'] FROM foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using(timestamp: 100) }
    let(:cql) { "DELETE FROM foo USING TIMESTAMP 100;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.where(bar: :baz).where(qux: cql_in(:one, :two)) }
    let(:cql) { "DELETE FROM foo WHERE bar = 'baz' AND qux IN ('one', 'two');" }
  end

  it_behaves_like :query_builder do
    subject   { statement.where(cql_element[:qux, 3] => :foo) }
    let(:cql) { "DELETE FROM foo WHERE qux[3] = 'foo';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_exists }
    let(:cql) { "DELETE FROM foo IF EXISTS;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if(baz: 5, qux: :one) }
    let(:cql) { "DELETE FROM foo IF baz = 5 AND qux = 'one';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if(baz: 5).if(qux: :one) }
    let(:cql) { "DELETE FROM foo IF baz = 5 AND qux = 'one';" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if(bar: :baz, qux: 3) }
    let(:cql) { "DELETE FROM foo IF bar = 'baz' AND qux = 3;" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .use(:abc)
        .values(:bar, :baz)
        .where(bar: :baz, qux: cql_in(:one, :two), cql_element[:qux, 3] => 4)
        .if(baz: 5)
        .using(timestamp: 100)
        .if_exists
    end

    let(:cql) { "DELETE bar, baz FROM abc.foo USING TIMESTAMP 100 WHERE bar = 'baz' AND qux IN ('one', 'two') AND qux[3] = 4 IF EXISTS AND baz = 5;" }
  end

end # describe QueryBuilder::CQL.insert_into
