# encoding: utf-8

require "cql_builder/rspec"

describe CQLBuilder::Clauses::CompactStorage do

  let(:clause) { described_class.new }

  it_behaves_like :a_clause, :compact_storage

  describe "#to_s" do
    subject { clause.to_s }
    it { is_expected.to eql("COMPACT STORAGE") }
  end # describe #type

end # describe CQLBuilder::Clauses::CompactStorage
