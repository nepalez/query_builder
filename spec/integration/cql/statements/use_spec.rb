# encoding: utf-8

describe QueryBuilder::CQL, ".use" do

  let(:statement) { described_class.use(:foo) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "USE foo;" }
  end

end # describe QueryBuilder::CQL.use
