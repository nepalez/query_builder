# encoding: utf-8

describe CQLBuilder::Clauses::IfExists do

  let(:clause) { described_class.new }

  it_behaves_like :a_clause, :if_exists

  describe "#to_s" do
    subject { clause.to_s }

    context "by default" do
      it { is_expected.to eql("IF EXISTS") }
    end # context

    context "when reversed" do
      let(:clause) { described_class.new reverse: true }

      it { is_expected.to eql("IF NOT EXISTS") }
    end
  end # describe #to_s

end # describe CQLBuilder::Clauses::IfExists
