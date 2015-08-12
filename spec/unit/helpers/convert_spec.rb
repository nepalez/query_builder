# encoding: utf-8

require "securerandom"

module CQLBuilder

  describe CQLBuilder::Helpers, ".convert" do
    subject { described_class.convert(value) }

    context "nil" do
      let(:value) { nil }
      it { is_expected.to eql("NaN") }
    end # context

    context ":NaN" do
      let(:value) { :NaN }
      it { is_expected.to eql("NaN") }
    end # context

    context "NaN" do
      let(:value) { "NaN" }
      it { is_expected.to eql("NaN") }
    end # context

    context ":Infinity" do
      let(:value) { :Infinity }
      it { is_expected.to eql("Infinity") }
    end # context

    context "Infinity" do
      let(:value) { "Infinity" }
      it { is_expected.to eql("Infinity") }
    end # context

    context "UUID" do
      let(:value) { SecureRandom.uuid }
      it { is_expected.to eql(value) }
    end # context

    context "blob" do
      let(:value) { "0x03" }
      it { is_expected.to eql(value) }
    end # context

    context "numeric" do
      let(:value) { 10.1 }
      it { is_expected.to eql "10.1" }
    end # context

    context "boolean" do
      let(:value) { true }
      it { is_expected.to eql "true" }
    end # context

    context "string" do
      let(:value) { "true" }
      it { is_expected.to eql "'true'" }
    end # context

    context "symbol" do
      let(:value) { :true }
      it { is_expected.to eql "'true'" }
    end # context

    context "hash" do
      let(:value) { { foo: :bar, baz: "0x03", qux: { quxx: true } } }
      it do
        is_expected
          .to eql "{'foo': 'bar', 'baz': 0x03, 'qux': {'quxx': true}}"
      end
    end # context

  end # describe CQLBuilder::Helpers.convert

end # module CQLBuilder
