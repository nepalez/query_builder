# encoding: utf-8

describe CQLBuilder, ".create_user" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.create_user(:foo) }

    it "works" do
      expect(subject).to eql "CREATE USER \"foo\";"
    end
  end

  context "with 'if_not_exists' clause" do
    let(:statement) do
      CQLBuilder.create_user(:foo).if_not_exists.if_not_exists
    end

    it "works" do
      expect(subject).to eql "CREATE USER IF NOT EXISTS \"foo\";"
    end
  end

  context "with 'with_password' clause" do
    let(:statement) do
      CQLBuilder.create_user(:foo).with_password(:bar).with_password(:baz)
    end

    it "works" do
      expect(subject).to eql "CREATE USER \"foo\" WITH PASSWORD 'baz';"
    end
  end

  context "with 'superuser' clause" do
    let(:statement) do
      CQLBuilder.create_user(:foo).superuser
    end

    it "works" do
      expect(subject).to eql "CREATE USER \"foo\" SUPERUSER;"
    end
  end

  context "with 'superuser(false)' clause" do
    let(:statement) do
      CQLBuilder.create_user(:foo).superuser.superuser(false)
    end

    it "works" do
      expect(subject).to eql "CREATE USER \"foo\" NOSUPERUSER;"
    end
  end

  context "with all clauses" do
    let(:statement) do
      CQLBuilder
        .create_user(:foo)
        .if_not_exists
        .with_password(:bar)
        .superuser
    end

    it "works" do
      expect(subject)
        .to eql "CREATE USER IF NOT EXISTS \"foo\" WITH PASSWORD 'bar' SUPERUSER;"
    end
  end

end # describe CQLBuilder.create_user
