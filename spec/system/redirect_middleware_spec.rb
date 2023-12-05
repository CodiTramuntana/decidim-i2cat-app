# frozen_string_literal: true

require "rails_helper"

describe "Redirect Middleware", type: :system do
  let!(:organization) { create(:organization) }
  let!(:what_is_page) { create(:static_page, :with_topic, organization: organization, title: { ca: "Què és?" }, slug: "que-es") }

  before do
    switch_to_host(organization.host)
  end

  describe "Pages redirect" do
    it "redirects to the 'que-es' page when /pages is visited" do
      visit decidim.pages_path

      expect(page).to have_content(what_is_page.title["ca"])
    end
  end
end
