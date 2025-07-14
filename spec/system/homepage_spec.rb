# frozen_string_literal: true

require "spec_helper"

describe "Homepage" do
  include Decidim::SanitizeHelper

  let!(:organization) do
    create(
      :organization,
      name: "Decidim Application",
      default_locale: :ca,
      available_locales: [:ca, :en, :es],
      description: {
        ca: "Missatge secundari\nInformació de l'organització",
        es: "Mensaje secundario\nInformación de la organización",
        en: "Subhero message\nOrganization info"
      }
    )
  end
  let!(:hero) { create(:content_block, organization: organization, scope_name: :homepage, manifest_name: :hero, settings: { "welcome_text_ca"=>"Benvinguda a Decidim Application" }) }
  let!(:sub_hero) { create(:content_block, organization: organization, scope_name: :homepage, manifest_name: :sub_hero) }
  let(:arca_organization_id) { nil }

  before do
    ENV["ARCA_ORGANIZATION_ID"]= arca_organization_id
    switch_to_host(organization.host)
    I18n.with_locale(:ca) do
      visit decidim.root_path(locale: I18n.locale)
    end
  end

  it "loads and shows organization name and main blocks" do
    expect(page).to have_content("Decidim Application")

    within "section .hero .hero__title" do
      expect(page).to have_content("Benvinguda a Decidim Application")
    end

    subhero_msg = organization.description[:ca]

    within("section#sub_hero") do
      expect(page).to have_content(subhero_msg)
    end
  end

  context "when organization is ARCA" do
    let(:arca_organization_id) { organization.id.to_s }

    it "renders its custom menu title" do
      expect(page).to have_css("h3.menu-bar__main-dropdown__title", visible: :all)
      expect(page).to have_content("Inici")
      expect(page).to have_content("Agenda Rural de Catalunya")
      expect(page).to have_content("Atles del Món Rural")
    end
  end
end
