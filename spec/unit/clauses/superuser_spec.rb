# encoding: utf-8

describe CQLBuilder::Clauses::Superuser do

  let(:clause) { described_class.new }

  it_behaves_like :a_clause, :superuser

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
