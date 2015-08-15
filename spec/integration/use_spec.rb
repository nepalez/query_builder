# encoding: utf-8

describe CQLBuilder, ".use" do

  let(:statement) { CQLBuilder.use(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "USE foo;" }
  end

end # describe CQLBuilder.use
