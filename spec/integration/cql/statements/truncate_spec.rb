# encoding: utf-8

describe QueryBuilder::CQL, ".truncate" do

  let(:statement) { described_class.truncate(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "TRUNCATE foo;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "TRUNCATE baz.foo;" }
  end

end # describe QueryBuilder::CQL.truncate
