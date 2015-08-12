# encoding: utf-8

module CQLBuilder

  describe CQLBuilder::Clause do

    let(:klass) do
      Class.new(described_class) { attribute :foo, default: :BAR }
    end

    describe ".new" do
      subject { klass.new }

      it "is immutable" do
        expect(subject).to be_frozen
      end

      it "is comparable" do
        expect(subject).to be_kind_of Base
      end
    end # describe .new

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

  end # describe CQLBuilder::Clause

end # module CQLBuilder
