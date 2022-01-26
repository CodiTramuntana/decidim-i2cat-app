# frozen_string_literal: true

require "rails_helper"

describe "Visit assemblies", type: :system do
  let(:organization) { create :organization }
  let!(:assembly) { create(:assembly, organization: organization) }

  context "when visiting the assemblies participatory space with tags" do
    before do
      stub_const("I2cat::HOST_W_CUSTOM_TAGS_ASSEMBLIES", organization.host)
      switch_to_host(organization.host)
      visit decidim_assemblies.assemblies_path
    end

    it "lists the parent assemblies" do
      within "#parent-assemblies" do
        within "#parent-assemblies h3" do
          expect(page).to have_content("1")
        end

        expect(page).to have_selector(".open_close_status")
        expect(page).not_to have_selector(".creation_date_status")
      end
    end
  end

  context "when visiting the assemblies participatory space without tags" do
    before do
      switch_to_host(organization.host)
      visit decidim_assemblies.assemblies_path
    end

    it "lists the parent assemblies" do
      within "#parent-assemblies" do
        within "#parent-assemblies h3" do
          expect(page).to have_content("1")
        end

        expect(page).not_to have_selector(".open_close_status")
        expect(page).to have_selector(".creation_date_status")
      end
    end
  end
end
