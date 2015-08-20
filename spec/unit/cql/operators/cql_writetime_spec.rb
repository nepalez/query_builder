# encoding: utf-8

describe QueryBuilder::CQL::Operators, ".cql_writetime" do

  let(:arguments) { [:cql_writetime] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :name }
    let(:output) { "WRITETIME(name)" }
  end

end # describe QueryBuilder::CQL::Operators.cql_writetime
