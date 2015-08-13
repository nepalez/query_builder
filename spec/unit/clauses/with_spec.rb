# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::With do

    let(:clause) { described_class.new(column: :foo, value: :bar) }

    describe ".new" do
      subject { clause }

      it "is a Condition clause" do
        expect(subject).to be_kind_of Clauses::Condition
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#type" do
      subject { clause.type }
      it { is_expected.to eql :with }
    end # describe #type

  end # describe CQLBuilder::Clauses::With

end # module CQLBuilder
