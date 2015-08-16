# encoding: utf-8

describe QueryBuilder::Core::Statement do

  let(:klass)      { Class.new(described_class) { attribute :foo } }
  let(:statement)  { klass.new(attributes) { [bar, baz] } }
  let(:attributes) { { foo: :FOO } }

  let(:clause) do
    Class.new(QueryBuilder::Core::Clause) { def to_s; type.to_s; end }
  end

  let(:bar)    { Class.new(clause) { type :bar }.new }
  let(:baz)    { Class.new(clause) { type :baz }.new }
  let(:qux)    { Class.new(clause) { type :qux }.new }

  describe ".new" do
    subject { statement }

    it "is a node" do
      expect(subject).to be_kind_of(QueryBuilder::Core::Base)
    end

    it "is immutable" do
      expect(subject).to be_frozen
    end
  end # describe .new

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

    shared_examples :updating_statement do
      it "returns the same statement" do
        expect(subject).to eql(statement)
        expect(subject).not_to equal(statement)
      end

      it "adds the clause" do
        expect(subject.clauses).to match_array(clauses)
      end
    end # shared examples

    it_behaves_like :updating_statement do
      subject { statement << qux }
      let(:clauses) { %w(bar baz qux) }
    end

    it_behaves_like :updating_statement do
      subject { statement << bar }
      let(:clauses) { %w(bar baz) }
    end
  end # describe #<<

end # describe QueryBuilder::Core::Statement
