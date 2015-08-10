# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clause do

    let(:klass) do
      Class.new(described_class) { attribute :foo, default: :BAR }
    end

    let(:clause)     { klass.new(type, attributes) }
    let(:attributes) { { foo: :FOO } }
    let(:type)       { :where }
    let(:cql)        { "WHERE" }

    describe ".new" do
      subject { clause }

      it "is immutable" do
        expect(subject).to be_frozen
      end

      it "is comparable" do
        expect(subject).to be_kind_of Base
      end
    end # describe .new

    describe "#type" do
      subject { clause.type }

      it "is initialized" do
        expect(subject).to eql(type)
      end
    end # describe #type

    describe "#attributes" do
      subject { clause.attributes }

      context "by default" do
        let(:clause) { klass.new type }

        it "returns default hash" do
          expect(subject).to eql(foo: :BAR)
        end
      end

      context "initialized" do
        it "is assigned" do
          expect(subject).to eql(attributes)
        end
      end
    end # describe #type

    describe "#to_cql" do
      subject { clause.to_cql }

      it "returns upcased type" do
        expect(subject).to eql(cql)
      end
    end # describe #to_cql

    shared_examples :comparable_by_type_and_attributes do
      context "of the same type and attributes" do
        let(:other) { klass.new(type, attributes) }
        it { is_expected.to eql true }
      end # context

      context "of another type" do
        let(:other) { klass.new(:set, attributes) }
        it { is_expected.to eql false }
      end # context

      context "with other attributes" do
        let(:other) { klass.new(type) }
        it { is_expected.to eql false }
      end # context

      context "not a clause" do
        let(:other) { Object.new }
        it { is_expected.to eql false }
      end # context
    end # end

    describe "#==" do
      it_behaves_like :comparable_by_type_and_attributes do
        subject { clause == other }
      end
    end # describe #==

    describe "#eql?" do
      it_behaves_like :comparable_by_type_and_attributes do
        subject { clause.eql? other }
      end
    end # describe #eql?

  end # describe CQLBuilder::Clause

end # module CQLBuilder
