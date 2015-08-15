# encoding: utf-8

describe CQLBuilder::Clauses::PrimaryKey do

  let(:clause) { described_class.new(columns: [:foo, :bar]) }

  it_behaves_like :a_clause, :primary_key

  describe "#to_s" do
    subject { clause.to_s }
    it { is_expected.to eql "PRIMARY KEY (foo, bar)" }
  end # describe #type

end # describe CQLBuilder::Clauses::PrimaryKey
