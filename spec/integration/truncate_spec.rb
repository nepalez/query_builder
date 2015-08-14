# encoding: utf-8

describe CQLBuilder, ".truncate" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.truncate(:foo) }

    it "works" do
      expect(subject).to eql "TRUNCATE \"foo\";"
    end
  end

  context "with 'use' clause" do
    let(:statement) { CQLBuilder.truncate(:foo).use(:bar).use(:baz) }

    it "works" do
      expect(subject).to eql "TRUNCATE \"baz\".\"foo\";"
    end
  end

end # describe CQLBuilder.truncate
