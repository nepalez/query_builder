# encoding: utf-8

shared_examples :a_clause do |type|

  it "[is a clause]" do
    expect(clause).to be_kind_of(CQLBuilder::Clause)
  end

  it "[is immutable]" do
    expect(clause).to be_frozen
  end

  it "[has valid type]" do
    expect(clause.type).to eql(type)
  end

end # shared examples
