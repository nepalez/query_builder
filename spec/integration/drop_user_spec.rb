# encoding: utf-8

describe CQLBuilder, ".drop_user" do

  let(:statement) { CQLBuilder.drop_user(:foo) }

  it_behaves_like :a_statement do
    subject   { statement }
    let(:cql) { "DROP USER \"foo\";" }
  end

  it_behaves_like :a_statement do
    subject   { statement.if_exists.if_exists }
    let(:cql) { "DROP USER IF EXISTS \"foo\";" }
  end

end # describe CQLBuilder.drop_user
