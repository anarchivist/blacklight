require 'spec_helper'

RSpec.describe Blacklight::Configuration::Field do
  let(:instance) { described_class.new }
  describe "#field_label" do
    it "looks up the label as an i18n string" do
      allow(I18n).to receive(:t).with(:some_key, default: []).and_return "my label"
      label = instance.field_label :some_key

      expect(label).to eq "my label"
    end

    it "passes the provided i18n keys to I18n.t" do
      allow(I18n).to receive(:t).with(:key_a, default: [:key_b, "default text"])

      label = instance.field_label :key_a, :key_b, "default text"
    end

    it "compacts nil keys (fixes rails/rails#19419)" do
      allow(I18n).to receive(:t).with(:key_a, default: [:key_b])

      label = instance.field_label :key_a, nil, :key_b

    end
  end
end
