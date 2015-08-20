# encoding: utf-8

describe "CREATE ROLE" do

  include QueryBuilder::CQL::Operators

  let(:role) { QueryBuilder::CQL.role(:admin) }

  it_behaves_like :query_builder do
    subject { role.create }

    let(:cql) { "CREATE ROLE admin;" }
  end

  it_behaves_like :query_builder do
    subject do
      role.create
        .if_not_exists
        .with(password: :foobar)
        .with(superuser: true, login: true)
    end

    let(:cql) { "CREATE ROLE IF NOT EXISTS admin WITH password = 'foobar' AND superuser = true AND login = true;" }
  end

end # describe CREATE ROLE
