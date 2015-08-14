# encoding: utf-8

describe CQLBuilder::Clauses::Use do

  let(:clause) { described_class.new(name: :foo) }

  it_behaves_like :a_clause, :use

  describe "#to_s" do
    subject { clause.to_s }
    it { is_expected.to eql("\"foo\"") }
  end # describe #type

end # describe CQLBuilder::Clauses::Use
