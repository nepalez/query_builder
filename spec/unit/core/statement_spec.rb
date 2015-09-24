# encoding: utf-8

describe QueryBuilder::Core::Statement do

  let(:klass)      { Class.new(described_class) { attribute :foo } }
  let(:statement)  { klass.new(attributes) { [bar, baz] } }
  let(:attributes) { { foo: :FOO } }

  let(:clause) do
    Class.new(QueryBuilder::Core::Clause) { def to_s; type.to_s; end }
  end

  let(:bar) { Class.new(clause) { type :bar }.new }
  let(:baz) { Class.new(clause) { type :baz }.new }
  let(:qux) { Class.new(clause) { type :qux }.new }

  describe ".new" do
    subject { statement }

    it "is a node" do
      expect(subject).to be_kind_of(QueryBuilder::Core::Base)
    end

    it "is immutable" do
      expect(subject).to be_immutable
    end
  end # describe .new

  describe "#context" do
    subject { statement.context }

    context "by default" do
      it { is_expected.to be_nil }
    end # context

    context "when assigned" do
      let(:statement) { described_class.new(context: :foo) }

      it { is_expected.to eq(:foo) }
    end
  end # describe #context

  describe "#clauses" do
    subject { statement.clauses }

    context "by default" do
      let(:statement) { klass.new(attributes) }

      it "returns the empty array" do
        expect(subject).to eql %w()
      end
    end # context

    context "without attributes" do
      it "is initialized from the block" do
        expect(subject).to eql %w(bar baz)
      end
    end

    context "with an argument" do
      subject { statement.clauses(:baz) }

      it "selects clauses by type" do
        expect(subject).to eql %w(baz)
      end
    end # context
  end # describe #clauses

  describe "#<<" do

    context "new clause" do
      subject { statement << qux }

      it "preserves attributes" do
        expect(subject.attributes).to eql(statement.attributes)
      end

      it "adds the clause" do
        expect(subject.clauses).to eql %w(bar baz qux)
      end
    end # context

    context "existing clause" do
      subject { statement << bar }

      it "preserves attributes" do
        expect(subject.attributes).to eql(statement.attributes)
      end

      it "rewrites the clause" do
        expect(subject.clauses).to eql %w(baz bar)
      end
    end
  end # describe #<<

end # describe QueryBuilder::Core::Statement
