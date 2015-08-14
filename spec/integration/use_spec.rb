# encoding: utf-8

describe CQLBuilder, ".use" do

  subject { statement.to_s }

  let(:statement) { CQLBuilder.use(:foo) }

  it "works" do
    expect(subject).to eql "USE \"foo\";"
  end

end # describe CQLBuilder.use
