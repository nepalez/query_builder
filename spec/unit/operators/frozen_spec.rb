# encoding: utf-8

describe CQLBuilder::Operators, ".frozen" do

  let(:arguments) { [:frozen] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :foo }
    let(:output) { "FROZEN <foo>" }
  end

end # describe CQLBuilder::Operators.frozen
