# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Base do

    let(:klass)      { Class.new(described_class) }
    let(:instance)   { klass.new(attributes) }
    let(:attributes) { { foo: :FOO } }

    describe ".attribute" do
      shared_examples :adding_attribute do
        it "updates .attributes" do
          expect { subject }
            .to change { klass.attributes.map(&:name) }
            .from([])
            .to([:foo])
        end

        it "adds key to the #attributes" do
          expect { subject }
            .to change { klass.new.attributes }
            .from({})
            .to(foo: default)
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
      subject { Class.new(klass).attributes.map(&:name) }

      let(:klass) do
        Class.new(described_class) { attribute :foo, default: :FOO }
      end

      it "inherits the default attibutes of parent class" do
        expect(subject).to eql [:foo]
      end
    end # describe .inherited

    describe ".new" do
      subject { instance }

      before { klass.attribute :foo, required: true }

      it "is immutable" do
        expect(subject).to be_frozen
      end

      it "is comparable" do
        expect(subject).to be_kind_of Comparable
      end

      it "doesn't freeze attributes" do
        expect { subject }.not_to change { attributes.frozen? }
      end

      context "with unknown attribute" do
        let(:attributes) { { foo: :FOO, bar: :BAR } }

        it "raises AttributeError" do
          expect { subject }.to raise_error do |error|
            expect(error).to be_kind_of Exceptions::AttributeError
            expect(error.message).to include "unknown "
            expect(error.message).to include "bar"
          end
        end
      end

      context "with missed attribute" do
        before { klass.attribute :bar, required: true }

        it "raises AttributeError" do
          expect { subject }.to raise_error do |error|
            expect(error).to be_kind_of Exceptions::AttributeError
            expect(error.message).to include "missed "
            expect(error.message).to include "bar"
          end
        end
      end
    end # describe .new

    describe "#to_s" do
      subject { instance.to_s }

      let(:klass) { Class.new(described_class) { attribute :foo } }

      it "returns empty string" do
        expect(subject).to eql("")
      end
    end # describe #to_s

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
      subject { instance == other }

      it_behaves_like :comparable_by_kind_and_attributes
    end # describe #==

    describe "#eql?" do
      subject { instance.eql? other }

      it_behaves_like :comparable_by_kind_and_attributes
    end # describe #eql?

  end # describe CQLBuilder::Base

end # module CQLBuilder
