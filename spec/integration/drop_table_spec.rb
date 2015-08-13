# encoding: utf-8

describe CQLBuilder, ".drop_table" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.drop_table(:foo) }

    it "works" do
      expect(subject).to eql "DROP TABLE 'foo';"
    end
  end

  context "with 'use' clause" do
    let(:statement) { CQLBuilder.drop_table(:foo).use(:bar).use(:baz) }

    it "works" do
      expect(subject).to eql "DROP TABLE 'baz'.'foo';"
    end
  end

  context "with 'if_exists' clause" do
    let(:statement) { CQLBuilder.drop_table(:foo).if_exists.if_exists }

    it "works" do
      expect(subject).to eql "DROP TABLE IF EXISTS 'foo';"
    end
  end

end # describe CQLBuilder.drop_table
