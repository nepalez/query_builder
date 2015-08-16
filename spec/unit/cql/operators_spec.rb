# encoding: utf-8

describe QueryBuilder::CQL::Operators do

  before do
    described_class.singleton_class.send(:define_method, :x) { |v, x| x * v }
    described_class.singleton_class.send(:define_method, :y) { |v| v }
    described_class.singleton_class.send :private, :y
  end

  let(:klass)    { Class.new { include QueryBuilder::CQL::Operators } }
  let(:instance) { klass.new }

  describe "#respond_to?" do
    subject { instance.respond_to? name }

    context "existing transproc" do
      let(:name) { :x }
      it { is_expected.to eql(true) }
    end

    context "private method" do
      let(:name) { :y }
      it { is_expected.to eql(false) }
    end

    context "non-existing transproc" do
      let(:name) { :z }
      it { is_expected.to eql(false) }
    end
  end # describe #respond_to?

  describe "#method_missing" do
    subject { instance.public_send(*args) }

    context "existing transproc" do
      let(:args) { [:x, 2] }

      it "returns a transproc" do
        expect(subject[3]).to eql described_class[*args][3]
      end
    end

    context "private method" do
      let(:args) { [:y] }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end

    context "non-existing transproc" do
      let(:args) { [:z] }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end
  end # describe #respond_to?

  after do
    described_class.singleton_class.send(:remove_method, :x)
    described_class.singleton_class.send(:remove_method, :y)
  end

end # describe QueryBuilder::Core::Operators
