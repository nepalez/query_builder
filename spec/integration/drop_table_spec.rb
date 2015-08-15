# encoding: utf-8

describe CQLBuilder, ".drop_table" do

  let(:statement) { CQLBuilder.drop_table(:foo) }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "DROP TABLE foo;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.use(:bar).use(:baz) }
    let(:cql) { "DROP TABLE baz.foo;" }
  end

  it_behaves_like :a_statement do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TABLE IF EXISTS foo;" }
  end

end # describe CQLBuilder.drop_table
