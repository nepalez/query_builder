# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clauses::WithPassword do

    let(:clause) { described_class.new(password: :foo) }

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
      it { is_expected.to eql(:with_password) }
    end # describe #type

    describe "#password" do
      subject { clause.password }
      it { is_expected.to eql(:foo) }
    end # describe #type

    describe "#to_s" do
      subject { clause.to_s }
      it { is_expected.to eql("WITH PASSWORD 'foo'") }
    end # describe #type

  end # describe CQLBuilder::Clauses::WithPassword

end # module CQLBuilder
