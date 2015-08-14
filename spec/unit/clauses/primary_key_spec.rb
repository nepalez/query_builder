# encoding: utf-8

require "cql_builder/rspec"

describe CQLBuilder::Clauses::PrimaryKey do

  let(:clause) { described_class.new(columns: [:foo]) }

  it_behaves_like :a_clause, :primary_key

  describe "#to_s" do
    subject { clause.to_s }

    context "with one column" do
      it { is_expected.to eql "PRIMARY KEY \"foo\"" }
    end

    context "with one column" do
      let(:clause) { described_class.new(columns: [:foo, :bar]) }

      it { is_expected.to eql "PRIMARY KEY (\"foo\", \"bar\")" }
    end
  end # describe #type

end # describe CQLBuilder::Clauses::PrimaryKey
