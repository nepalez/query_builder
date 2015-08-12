# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Operator do

    let(:klass)    { Class.new(described_class) }
    let(:operator) { klass.new value: value }
    let(:value)    { :foo }

    describe ".new" do
      subject { operator }

      it "is a kind of Base" do
        expect(subject).to be_kind_of Base
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#value" do
      subject { operator.value }

      it { is_expected.to eql(value) }
    end # describe #value

    describe "#to_s" do
      subject { operator.to_s(:bar) }

      it { is_expected.to eql("") }
    end # describe #to_s

  end # describe CQLBuilder::Operator

end # module CQLBuilder
