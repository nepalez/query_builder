# encoding: utf-8

require "cql_builder/rspec"

describe CQLBuilder::Clauses::WithPassword do

  let(:clause) { described_class.new(password: :foo) }

  it_behaves_like :a_clause, :with_password

  describe "#to_s" do
    subject { clause.to_s }
    it { is_expected.to eql("WITH PASSWORD 'foo'") }
  end # describe #type

end # describe CQLBuilder::Clauses::WithPassword
