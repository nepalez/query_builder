# encoding: utf-8

describe CQLBuilder, ".alter_user" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.alter_user(:foo) }

    it "works" do
      expect(subject).to eql "ALTER USER \"foo\";"
    end
  end

  context "with 'with_password' clause" do
    let(:statement) do
      CQLBuilder.alter_user(:foo).with_password(:bar).with_password(:baz)
    end

    it "works" do
      expect(subject).to eql "ALTER USER \"foo\" WITH PASSWORD 'baz';"
    end
  end

  context "with 'superuser' clause" do
    let(:statement) do
      CQLBuilder.alter_user(:foo).superuser
    end

    it "works" do
      expect(subject).to eql "ALTER USER \"foo\" SUPERUSER;"
    end
  end

  context "with 'superuser(false)' clause" do
    let(:statement) do
      CQLBuilder.alter_user(:foo).superuser.superuser(false)
    end

    it "works" do
      expect(subject).to eql "ALTER USER \"foo\" NOSUPERUSER;"
    end
  end

  context "with all clauses" do
    let(:statement) do
      CQLBuilder
        .alter_user(:foo)
        .with_password(:bar)
        .superuser
    end

    it "works" do
      expect(subject)
        .to eql "ALTER USER \"foo\" WITH PASSWORD 'bar' SUPERUSER;"
    end
  end

end # describe CQLBuilder.alter_user
