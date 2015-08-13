# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::Use do

    let(:clause) { described_class.new(name: :foo) }

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
      it { is_expected.to eql(:use) }
    end # describe #type

    describe "#name" do
      subject { clause.name }
      it { is_expected.to eql(:foo) }
    end # describe #type

    describe "#to_s" do
      subject { clause.to_s }
      it { is_expected.to eql("'foo'") }
    end # describe #type

  end # describe CQLBuilder::Clauses::Use

end # module CQLBuilder
