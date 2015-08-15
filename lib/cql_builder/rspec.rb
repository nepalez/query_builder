# encoding: utf-8

shared_examples :a_clause do |type|

  it "[is a clause]" do
    expect(subject).to be_kind_of(CQLBuilder::Clause)
  end

  it "[is immutable]" do
    expect(subject).to be_frozen
  end

  it "[has valid type]" do
    expect(subject.type).to eql(type)
  end

end # shared examples

shared_examples :cql_builder do

  it "[works]" do
    expect(subject.to_s).to eql(cql)
  end

end # shared examples
