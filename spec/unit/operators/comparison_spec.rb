# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Operators::Comparison do

    let(:klass)    { Class.new(described_class) }
    let(:operator) { klass.new value: value, symbol: symbol }
    let(:value)    { :bar }
    let(:symbol)   { :>=  }

    describe ".new" do
      subject { operator }

      it "is a base node" do
        expect(subject).to be_kind_of(Base)
      end

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#value" do
      subject { operator.value }

      it "is initialized" do
        expect(subject).to eql value
      end
    end # describe #value

    describe "#symbol" do
      subject { operator.symbol }

      it "is initialized" do
        expect(subject).to eql symbol
      end
    end # describe #symbol

    describe "#to_s" do
      subject { operator.to_s(:foo) }

      context "numeric value" do
        let(:value) { 1.3 }

        it "returns unquoted string" do
          expect(subject).to eql "foo >= 1.3"
        end
      end

      context "non-numeric value" do
        let(:value) { :bar }

        it "returns quoted string" do
          expect(subject).to eql "foo >= 'bar'"
        end
      end
    end # describe #symbol

  end # describe CQLBuilder::Operator::Comparison

end # module CQLBuilder
