# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::IfExists do

    let(:clause) { described_class.new }

    describe ".new" do
      subject { clause }

      it "is a Clause" do
        expect(subject).to be_kind_of Clause
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#type" do
      subject { clause.type }
      it { is_expected.to eql(:if_exists) }
    end # describe #type

    describe "#reverse" do
      subject { clause.reverse }

      context "by default" do
        it { is_expected.to eql(false) }
      end # context

      context "when reversed" do
        let(:clause) { described_class.new reverse: true }

        it { is_expected.to eql(true) }
      end
    end # describe #reverse

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

end # module CQLBuilder
