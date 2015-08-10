# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Statement do

    let(:klass)      { Class.new(described_class) { attribute :foo } }
    let(:statement)  { klass.new(attributes) { [bar, baz] } }
    let(:attributes) { { foo: :FOO } }
    let(:bar)        { Clause.new(:bar) }
    let(:baz)        { Clause.new(:baz) }
    let(:qux)        { Clause.new(:qux) }

    describe ".new" do
      subject { statement }

      it "is a node" do
        expect(subject).to be_kind_of(Base)
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
          expect(subject).to eql []
        end
      end # context

      context "without attributes" do
        it "is initialized from the block" do
          expect(subject).to eql [bar, baz]
        end
      end

      context "with an argument" do
        subject { statement.clauses(:baz) }

        it "selects clauses by type" do
          expect(subject).to eql [baz]
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
        let(:clauses) { [bar, baz, qux] }
      end

      it_behaves_like :updating_statement do
        subject { statement << bar }
        let(:clauses) { [bar, baz] }
      end
    end # describe #<<

  end # describe CQLBuilder::Statement

end # module CQLBuilder
