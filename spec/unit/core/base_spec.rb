# encoding: utf-8

describe QueryBuilder::Core::Base do

  let(:klass) { Class.new(described_class) { attribute :foo } }

  describe ".new" do
    shared_examples :object_constructor do
      it "[is immutable]" do
        expect(subject).to be_immutable
      end

      it "[doesn't freeze attributes]" do
        expect { subject }.not_to change { attributes.frozen? }
      end

      it "[initializes #attributes]" do
        expect(subject.attributes).to eql attributes
      end
    end

    it_behaves_like :object_constructor do
      subject { klass.new(attributes) }
      let(:attributes) { { foo: :FOO } }
    end

    it_behaves_like :object_constructor do
      subject { klass.new }
      let(:attributes) { { foo: nil } }
    end
  end # describe .new

  describe "#to_s" do
    subject { klass.new.to_s }

    it "returns empty string" do
      expect(subject).to eql("")
    end
  end # describe #to_s

end # describe QueryBuilder::Core::Base
