# frozen_string_literal: true

Decidim.menu :menu do |menu|
  if current_organization.id.to_s == ENV.fetch("ARCA_ORGANIZATION_ID", nil)
    menu.remove_item :participatory_processes
    menu.remove_item :assemblies
    menu.remove_item :conferences
    menu.add_item :agenda_rural,
                  I18n.t("arca_menu.agenda_rural"),
                  "/assemblies/reptes",
                  position: 2.01
    menu.add_item :atles_mon_rural,
                  I18n.t("arca_menu.atles_mon_rural"),
                  "/assemblies/atles",
                  position: 2.02
  end
end
