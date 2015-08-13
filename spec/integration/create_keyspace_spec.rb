# encoding: utf-8

describe CQLBuilder, "create_keyspace" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.create_keyspace(:foo) }

    it "works" do
      expect(subject).to eql "CREATE KEYSPACE 'foo';"
    end
  end

  context "with 'if_not_exists' clause" do
    let(:statement) do
      CQLBuilder.create_keyspace(:foo).if_not_exists.if_not_exists
    end

    it "works" do
      expect(subject).to eql "CREATE KEYSPACE IF NOT EXISTS 'foo';"
    end
  end

  context "with 'where' clauses" do
    let(:statement) do
      CQLBuilder
        .create_keyspace(:foo)
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    it "works" do
      expect(subject).to eql "CREATE KEYSPACE 'foo' WITH 'replication' = {'class': 'SimpleStrategy', 'replication_factor': 3} AND 'durable_writes' = false;"
    end
  end

end # describe "CREATE KEYSPACE"
