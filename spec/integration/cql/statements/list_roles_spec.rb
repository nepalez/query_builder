# encoding: utf-8

describe QueryBuilder::CQL, ".list_roles" do

  let(:statement) { described_class.list_roles }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "LIST ROLES;" }
  end

end # describe QueryBuilder::CQL.list_roles
