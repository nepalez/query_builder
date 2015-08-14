# encoding: utf-8

describe CQLBuilder::Clauses::With do

  let(:clause) { described_class.new(column: :foo, value: value) }
  let(:value)  { :bar }

  it_behaves_like :a_clause, :with

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

end # describe CQLBuilder::Clauses::With
