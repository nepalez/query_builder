# encoding: utf-8

describe CQLBuilder, ".create_type" do

  include CQLBuilder::Operators

  let(:statement) { CQLBuilder.create_type(:foo) }

  it_behaves_like :cql_builder do
    subject   { statement }
    let(:cql) { "CREATE TYPE foo ();" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.if_not_exists }
    let(:cql) { "CREATE TYPE IF NOT EXISTS foo ();" }
  end

  it_behaves_like :cql_builder do
    subject   { statement.use(:bar) }
    let(:cql) { "CREATE TYPE bar.foo ();" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement.field(:name, :text).field(:params, cql_map[:text, :text])
    end

    let(:cql) { "CREATE TYPE foo (name text, params MAP<text, text>);" }
  end

  it_behaves_like :cql_builder do
    subject do
      statement
        .use(:bar)
        .if_not_exists
        .field(:name, :text)
        .field(:params, cql_map[:text, :text])
    end

    let(:cql) { "CREATE TYPE IF NOT EXISTS bar.foo (name text, params MAP<text, text>);" }
  end

end # describe CQLBuilder.create_type
