# encoding: utf-8

describe CQLBuilder, ".alter_keyspace" do

  subject { statement.to_s }

  context "without clauses" do
    let(:statement) { CQLBuilder.alter_keyspace(:foo) }

    it "works" do
      expect(subject).to eql "ALTER KEYSPACE \"foo\";"
    end
  end

  context "with 'with' clauses" do
    let(:statement) do
      CQLBuilder
        .alter_keyspace(:foo)
        .with(replication: { class: :SimpleStrategy, replication_factor: 3 })
        .with(durable_writes: false)
    end

    it "works" do
      expect(subject).to eql "ALTER KEYSPACE \"foo\" WITH \"replication\" = {'class': 'SimpleStrategy', 'replication_factor': 3} AND \"durable_writes\" = false;"
    end
  end

end # describe CQLBuilder.alter_keyspace
