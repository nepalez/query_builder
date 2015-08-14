# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::Condition do

    let(:clause) { described_class.new(column: column, value: value) }
    let(:column) { :foo }
    let(:value)  { :bar }

    describe ".new" do
      subject { clause }

      it "is a Clause" do
        expect(subject).to be_kind_of Clause
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#column" do
      subject { clause.column }
      it { is_expected.to eql(column) }
    end # describe #type

    describe "#value" do
      subject { clause.value }
      it { is_expected.to eql(value) }
    end # describe #type

    describe "#to_s" do
      subject { clause.to_s }

      context "with non-operator value" do
        it { is_expected.to eql "\"foo\" = 'bar'" }
      end # context

      context "with operator" do
        let(:value) { -> col { "COUNT(\"#{col}\")" } }
        it { is_expected.to eql "COUNT(\"foo\")" }
      end
    end # describe #to_s

  end # describe CQLBuilder::Clauses::Condition

end # module CQLBuilder
