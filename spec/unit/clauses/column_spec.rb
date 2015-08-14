# encoding: utf-8

describe CQLBuilder::Clauses::Column do

  let(:clause) { described_class.new(name: :foo, type_name: :int) }

  it_behaves_like :a_clause, :column

  describe "#to_s" do
    subject { clause.to_s }

    context "by default" do
      it { is_expected.to eql "foo int" }
    end

    context "when static" do
      let(:clause) do
        described_class.new(name: :foo, type_name: :int, static: true)
      end

      it { is_expected.to eql "foo int STATIC" }
    end
  end # describe #to_s

end # describe CQLBuilder::Clauses::Column
