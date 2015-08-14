# encoding: utf-8

describe CQLBuilder, ".drop_type" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.drop_type(:foo) }

    it "works" do
      expect(subject).to eql "DROP TYPE \"foo\";"
    end
  end

  context "with 'if_exists' clause" do
    let(:statement) do
      CQLBuilder.drop_type(:foo).if_exists.if_exists
    end

    it "works" do
      expect(subject).to eql "DROP TYPE IF EXISTS \"foo\";"
    end
  end

end # describe CQLBuilder.drop_type
