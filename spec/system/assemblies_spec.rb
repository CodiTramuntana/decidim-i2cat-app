# frozen_string_literal: true

require "spec_helper"

describe "Visit assemblies" do
  let(:organization) { create(:organization) }
  let!(:assembly) { create(:assembly, organization: organization) }

  context "when visiting the assemblies participatory space with tags" do
    before do
      switch_to_host(organization.host)
      visit decidim_assemblies.assemblies_path
    end

    it "lists the parent assemblies" do
      expect(page).to have_css("h1.title-decorator")

      within "#assemblies-grid" do
        expect(page).to have_css("h2.decorator")
        expect(page).to have_css(".card__grid-grid")
      end
    end
  end
end
