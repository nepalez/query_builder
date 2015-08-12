# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Attribute do

    let(:attribute) { described_class.new :foo }

    describe ".new" do
      subject { attribute }

      it "is immutable" do
        expect(subject).to be_frozen
      end
    end # describe .new

    describe "#arguments" do
      subject { attribute.arguments }

      let(:arguments) { [:foo, default: :FOO, required: true] }
      let(:attribute) { described_class.new(*arguments) }

      it "returns argumens of the initializer" do
        expect(subject).to eql(arguments)
      end
    end # describe #arguments

    describe "#name" do
      subject { attribute.name }

      it "is initialized" do
        expect(subject).to eql(:foo)
      end
    end # describe #name

    describe "#default" do
      subject { attribute.default }

      context "by default" do
        it "returns nil" do
          expect(subject).to be_nil
        end
      end # context

      context "when value is set" do
        let(:attribute) { described_class.new :foo, default: :FOO }

        it "is initialized" do
          expect(subject).to eql(:FOO)
        end
      end # context
    end # describe #default

    describe "#required" do
      subject { attribute.required }

      context "by default" do
        it "returns false" do
          expect(subject).to eql(false)
        end
      end # context

      context "when value is set" do
        let(:attribute) { described_class.new :foo, required: true }

        it "is initialized" do
          expect(subject).to eql(true)
        end
      end # context
    end # describe #required

  end # describe CQLBuilder::Attribute

end # module CQLBuilder
