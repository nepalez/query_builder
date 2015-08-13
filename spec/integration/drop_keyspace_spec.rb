# encoding: utf-8

describe CQLBuilder, ".drop_keyspace" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.drop_keyspace(:foo) }

    it "works" do
      expect(subject).to eql "DROP KEYSPACE 'foo';"
    end
  end

  context "with 'if_exists' clause" do
    let(:statement) do
      CQLBuilder.drop_keyspace(:foo).if_exists.if_exists
    end

    it "works" do
      expect(subject).to eql "DROP KEYSPACE IF EXISTS 'foo';"
    end
  end

end # describe CQLBuilder.drop_keyspace
