# encoding: utf-8

describe CQLBuilder::Base do

  let(:klass) { Class.new(described_class) }
  let(:instance) { klass.new(attributes) }
  let(:attributes) { { foo: :FOO } }

  describe ".attributes" do
    subject { klass.attributes }

    it "returns the empty hash" do
      expect(subject).to eql({})
    end
  end # describe .attributes

  describe ".attribute" do
    shared_examples :adding_attribute do
      it "updates .attributes" do
        expect { subject }
          .to change { klass.attributes }
          .from({})
          .to(foo: default)
      end

      it "adds key to the #attributes" do
        expect { subject }
          .to change { klass.new.attributes }
          .from({})
          .to(foo: default)
      end

      it "allows to initialize #attributes" do
        expect { subject }
          .to change { klass.new(foo: :FOO).attributes }
          .from({})
          .to(foo: :FOO)
      end

      it "defines the instance method" do
        expect { subject }
          .to change { klass.instance_methods }
          .by [:foo]
      end

      it "makes the method to return the attribute" do
        subject
        expect(klass.new.foo).to eql(default)
        expect(klass.new(foo: :FOO).foo).to eql(:FOO)
      end
    end # shared examples

    it_behaves_like :adding_attribute do
      subject { klass.attribute :foo }
      let(:default) { nil }
    end

    it_behaves_like :adding_attribute do
      subject { klass.attribute :foo, default: default }
      let(:default) { :Foo }
    end
  end # describe .attributes

  describe ".inherited" do
    let(:klass) { Class.new(described_class) { attribute :foo, default: :FOO } }
    subject { Class.new(klass).attributes }

    it "inherits the default attibutes of parent class" do
      expect(subject).to eql(foo: :FOO)
    end
  end # describe .inherited

  describe ".new" do
    subject { instance }

    it "is immutable" do
      expect(subject).to be_frozen
    end

    it "is comparable" do
      expect(subject).to be_kind_of Comparable
    end

    it "doesn't freeze attributes" do
      expect { subject }.not_to change { attributes.frozen? }
    end
  end # describe .new

  describe "#to_cql" do
    subject { instance.to_cql }

    it "returns empty string" do
      expect(subject).to eql("")
    end
  end # describe #to_cql

  shared_examples :comparable_by_kind_and_attributes do
    before { klass.attribute :foo }

    context "of the same type and attributes" do
      let(:other) { klass.new(attributes) }
      it { is_expected.to eql true }
    end # context

    context "of another kind" do
      let(:other) { Class.new(klass).new(attributes) }
      it { is_expected.to eql false }
    end # context

    context "with other attributes" do
      let(:other) { klass.new }
      it { is_expected.to eql false }
    end # context
  end # end

  describe "#==" do
    it_behaves_like :comparable_by_kind_and_attributes do
      subject { instance == other }
    end
  end # describe #==

  describe "#eql?" do
    it_behaves_like :comparable_by_kind_and_attributes do
      subject { instance.eql? other }
    end
  end # describe #eql?

end # describe CQLBuilder::Base
