# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::Column do

    let(:clause) { described_class.new(name: :foo, type_name: :int) }

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
      it { is_expected.to eql :column }
    end # describe #type

    describe "#name" do
      subject { clause.name }
      it { is_expected.to eql :foo }
    end # describe #type

    describe "#type_name" do
      subject { clause.type_name }
      it { is_expected.to eql :int }
    end # describe #type

    describe "#static" do
      subject { clause.static }

      context "by default" do
        it { is_expected.to eql(false) }
      end

      context "when static" do
        let(:clause) do
          described_class.new(name: :foo, type_name: :int, static: true)
        end

        it { is_expected.to eql(true) }
      end
    end # describe #static

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

end # module CQLBuilder
