# encoding: utf-8

describe CQLBuilder, ".list_users" do

  subject { statement.to_s }

  let(:statement) { CQLBuilder.list_users }

  it "works" do
    expect(subject).to eql "LIST USERS;"
  end

end # describe CQLBuilder.list_users
