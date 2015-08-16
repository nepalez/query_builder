# encoding: utf-8

describe QueryBuilder::CQL::Clauses::PrimaryKey do

  subject { described_class.new(args) }

  let(:args) { { columns: [:foo, :bar] } }

  it_behaves_like :a_clause, :primary_key

  it_behaves_like :query_builder do
    let(:cql) { "PRIMARY KEY (foo, bar)" }
  end

  it_behaves_like :query_builder do
    let(:args) { { columns: [:foo] } }
    let(:cql)  { "PRIMARY KEY (foo)" }
  end

end # describe QueryBuilder::CQL::Clauses::PrimaryKey
