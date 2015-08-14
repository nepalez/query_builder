# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::Superuser do

    let(:clause) { described_class.new }

    describe ".new" do
      subject { clause }

      it "is a clause" do
        expect(subject).to be_kind_of Clause
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#type" do
      subject { clause.type }
      it { is_expected.to eql(:superuser) }
    end # describe #type

    describe "#reverse" do
      subject { clause.reverse }

      context "by default" do
        it { is_expected.to eql(false) }
      end

      context "when reversed" do
        let(:clause) { described_class.new reverse: true }

        it { is_expected.to eql(true) }
      end
    end # describe #type

    describe "#to_s" do
      subject { clause.to_s }

      context "by default" do
        it { is_expected.to eql("SUPERUSER") }
      end

      context "when reversed" do
        let(:clause) { described_class.new reverse: true }

        it { is_expected.to eql("NOSUPERUSER") }
      end
    end # describe #type

  end # describe CQLBuilder::Clauses::Superuser

end # module CQLBuilder
