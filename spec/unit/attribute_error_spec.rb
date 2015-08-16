# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::AttributeError do

    let(:error) { described_class.new(:missed, attributes) }
    let(:attributes) { [:foo] }

    describe ".new" do
      subject { error }

      it "is a KeyError" do
        expect(error).to be_kind_of KeyError
      end

      it "is immutable" do
        expect(error).to be_frozen
      end
    end # describe .new

    describe "#message" do
      subject { error.message }

      context "with one attribute" do
        it "returns proper text" do
          expect(subject).to eql "missed attribute: :foo"
        end
      end # context

      context "with many attributes" do
        let(:attributes) { [:foo, :bar] }

        it "returns proper text" do
          expect(subject).to eql "missed attributes: :foo, :bar"
        end
      end # context
    end # describe #message

  end # describe CQLBuilder::AttributeError

end # module CQLBuilder
