require 'spec_helper'

RSpec.describe Blacklight::Configuration::FacetField do
  let(:instance) { described_class.new(key: "my_field", label: "some label") }
  describe "#facet_field_label" do
    before do
      allow(instance).to receive(:field_label).with(:"blacklight.search.fields.facet.my_field", :"blacklight.search.fields.my_field", "some label", "My field")
    end

    it "looks up the label to display for the given document and field" do
      instance.facet_field_label
    end
  end
end

