# encoding: utf-8

describe QueryBuilder::Core::Context do

  describe ".new" do
    subject { described_class.new }

    it "is a node" do
      expect(subject).to be_kind_of(QueryBuilder::Core::Base)
    end

    it "is immutable" do
      expect(subject).to be_frozen
    end
  end # describe .new

end # describe QueryBuilder::Core::Statement
