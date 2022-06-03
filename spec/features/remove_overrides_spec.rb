# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Overrides" do
  it "remove overrides after upgrading to v0.25" do
    # - Remove :ca and :es transations about whitelist errors
    expect(Decidim.version).to be < "0.25"
  end
end
