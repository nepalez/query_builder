# encoding: utf-8
require "securerandom"

describe CQLBuilder::Operators, ".cql" do

  let(:arguments) { [:cql] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { ["FOO", "", [], nil, "'bar'"] }
    let(:output) { "FOO 'bar';" }
  end

end # describe CQLBuilder::Operators.cql
