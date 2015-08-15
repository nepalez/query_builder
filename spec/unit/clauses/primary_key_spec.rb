# encoding: utf-8

describe CQLBuilder::Clauses::PrimaryKey do

  subject { described_class.new(args) }

  let(:args) { { columns: [:foo, :bar] } }

  it_behaves_like :a_clause, :primary_key

  it_behaves_like :cql_builder do
    let(:cql) { "PRIMARY KEY (foo, bar)" }
  end

  it_behaves_like :cql_builder do
    let(:args) { { columns: [:foo] } }
    let(:cql)  { "PRIMARY KEY (foo)" }
  end

end # describe CQLBuilder::Clauses::PrimaryKey
