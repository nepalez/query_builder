# encoding: utf-8

describe CQLBuilder::Operators, ".cql_identifier" do

  let(:arguments) { [:cql_identifier] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "foo bar" }
    let(:output) { "\"foo bar\"" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "\"foo\"" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "\"foo \"bar\"" }
    let(:output) { "\"\"\"foo \"\"bar\"\"\"" }
  end

end # describe CQLBuilder::Operators.cql_identifier
