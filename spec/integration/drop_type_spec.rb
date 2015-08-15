# encoding: utf-8

describe CQLBuilder, ".drop_type" do

  let(:statement) { CQLBuilder.drop_type(:foo) }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "DROP TYPE \"foo\";" }
  end

  it_behaves_like :a_statement do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP TYPE IF EXISTS \"foo\";" }
  end

end # describe CQLBuilder.drop_type
