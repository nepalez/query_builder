# encoding: utf-8

describe CQLBuilder::Operators, ".identifier" do

  let(:arguments) { [:identifier] }

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

end # describe CQLBuilder::Operators.identifier
