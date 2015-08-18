# encoding: utf-8

describe QueryBuilder::Core::Clause do

  let(:klass)   { Class.new(described_class) { attribute :foo, default: :BAR } }
  let(:clause)  { klass.new(options) }
  let(:options) { { foo: :FOO } }

  shared_examples :comparable_by_kind_and_attributes do

    context "of the same type and attributes" do
      let(:other) { klass.new(options) }
      it { is_expected.to eql true }
    end # context

    context "with other attributes" do
      let(:other) { klass.new }
      it { is_expected.to eql false }
    end # context

    context "of another kind" do
      let(:other) { Class.new(klass).new(options) }
      it { is_expected.to eql false }
    end # context

  end # end

  shared_examples :comparable_by_kind do

    context "of the same type and attributes" do
      let(:other) { klass.new(options) }
      it { is_expected.to eql true }
    end # context

    context "with other attributes" do
      let(:other) { klass.new }
      it { is_expected.to eql true }
    end # context

    context "of another kind" do
      let(:other) { Class.new(klass).new(options) }
      it { is_expected.to eql false }
    end # context

  end # end

  describe ".type" do
    subject { klass.type :foo }

    it "sets the class type" do
      expect { subject }
        .to change { klass.type }
        .from(nil)
        .to :foo
    end

    it "sets the instance's type" do
      expect { subject }
        .to change { klass.new.type }
        .from(nil)
        .to :foo
    end
  end # describe .type

  describe ".new" do
    subject { clause }

    it "is immutable" do
      expect(subject).to be_frozen
    end

    it "is comparable" do
      expect(subject).to be_kind_of QueryBuilder::Core::Base
    end
  end # describe .new

  describe "#==" do
    subject { clause == other }

    it_behaves_like :comparable_by_kind_and_attributes
  end # describe #==

  describe "#eql?" do
    subject { clause.eql? other }

    it_behaves_like :comparable_by_kind_and_attributes
  end # describe #eql?

  describe ".unique" do
    before { klass.unique }

    it_behaves_like :comparable_by_kind do
      subject { clause == other }
    end

    it_behaves_like :comparable_by_kind do
      subject { clause.eql? other }
    end
  end # describe .unique

end # describe QueryBuilder::Core::Clause
