# encoding: utf-8

describe QueryBuilder::CQL::Clauses::Field do

  subject { described_class.new(name: name) }
  let(:name) { :foo }

  it_behaves_like :a_clause, :field

  it_behaves_like :query_builder do
    let(:cql)  { "foo" }
  end

  it_behaves_like :query_builder do
    let(:name) { [:foo, :bar] }
    let(:cql)  { "(foo, bar)" }
  end

end # describe QueryBuilder::CQL::Clauses::Field
