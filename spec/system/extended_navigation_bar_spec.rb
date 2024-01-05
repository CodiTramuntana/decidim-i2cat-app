# frozen_string_literal: true

require "spec_helper"

describe "Extended navigation bar", type: :system do
  include Decidim::SanitizeHelper

  let!(:organization) { create(:organization) }
  let!(:normal_assembly) { create(:assembly, :published, organization: organization) }
  let!(:atles_assembly) { create(:assembly, :published, organization: organization, slug: "atles") }

  before do
    switch_to_host(organization.host)
  end

  it "render normal navigation bar when assembly is not 'atles'" do
    visit resource_locator(normal_assembly).path

    expect(page).not_to have_css(".custom-process-nav")
  end

  it "render custom navigation bar in when assembly is 'atles'" do
    visit resource_locator(atles_assembly).path

    expect(page).to have_css(".custom-process-nav")
  end
end
