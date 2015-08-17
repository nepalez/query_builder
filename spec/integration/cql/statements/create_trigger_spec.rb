# encoding: utf-8

describe QueryBuilder::CQL, ".create_trigger" do

  let(:statement) { described_class.create_trigger(:alert).on(:species) }

  it_behaves_like :query_builder do
    subject   { statement }
    let(:cql) { "CREATE TRIGGER alert ON species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.if_not_exists }
    let(:cql) { "CREATE TRIGGER IF NOT EXISTS alert ON species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.use(:wwf) }
    let(:cql) { "CREATE TRIGGER alert ON wwf.species;" }
  end

  it_behaves_like :query_builder do
    subject   { statement.using("wwf.triggers.alert") }
    let(:cql) { "CREATE TRIGGER alert ON species USING 'wwf.triggers.alert';" }
  end

  it_behaves_like :query_builder do
    subject do
      statement
        .use(:wwf)
        .if_not_exists
        .using("wwf.triggers.alert")
    end

    let(:cql) { "CREATE TRIGGER IF NOT EXISTS alert ON wwf.species USING 'wwf.triggers.alert';" }
  end

end # describe QueryBuilder::CQL.create_trigger
