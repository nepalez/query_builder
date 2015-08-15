# encoding: utf-8

describe CQLBuilder, ".truncate" do

  let(:statement) { CQLBuilder.truncate(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "TRUNCATE foo;" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "TRUNCATE baz.foo;" }
  end

end # describe CQLBuilder.truncate
