# frozen_string_literal: true

require "spec_helper"

describe "Homepage", type: :system do
  include Decidim::SanitizeHelper

  let!(:organization) do
    create(
      :organization,
      name: "Decidim Application",
      default_locale: :ca,
      available_locales: [:ca, :en, :es]
    )
  end
  let(:arca_organization_id) { nil }
  let!(:hero) { create :content_block, organization: organization, scope_name: :homepage, manifest_name: :hero, settings: { "welcome_text_ca"=>"Benvinguda a Decidim Application" } }
  let!(:sub_hero) { create :content_block, organization: organization, scope_name: :homepage, manifest_name: :sub_hero }

  before do
    ENV["ARCA_ORGANIZATION_ID"]= arca_organization_id
    switch_to_host(organization.host)
    visit decidim.root_path(locale: I18n.locale)
  end

  it "loads and shows organization name and main blocks" do
    within ".navbar" do
      # not ARCA
      expect(page).to have_content("Home\nHelp")
    end

    expect(page).to have_content("Decidim Application")
    within "section.hero .hero__container" do
      expect(page).to have_content("Benvinguda a Decidim Application")
    end
    within ".footer-separator section.subhero" do
      subhero_msg= translated(organization.description).gsub(%r{</p>\s+<p>}, "<br><br>").gsub(%r{<p>(((?!</p>).)*)</p>}mi, "\\1").gsub(%r{<script>(((?!</script>).)*)</script>}mi, "\\1")
      expect(page).to have_content(subhero_msg)
    end
  end

  context "when organization is ARCA" do
    let(:arca_organization_id) { organization.id.to_s }

    it "renders its custom menu items" do
      within ".navbar" do
        expect(page).to have_content("Home\nCatalonia's Rural Agenda\nRural World Atlas\nHelp")
      end
    end
  end
end
