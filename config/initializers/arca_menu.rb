# frozen_string_literal: true

Decidim.menu :menu do |menu|
  if current_organization.id.to_s == ENV.fetch("ARCA_ORGANIZATION_ID", nil)
    menu.remove_item :participatory_processes
    menu.remove_item :assemblies
    menu.remove_item :conferences
    menu.add_item :agenda_rural,
                  "Agenda Rural de Catalunya",
                  "https://www.donadelasegarraalurgellunclavell.cat/assemblies/reptes",
                  position: 2.01
    menu.add_item :agenda_rural,
                  "Atles del Món Rural",
                  "https://www.donadelasegarraalurgellunclavell.cat/assemblies/atles",
                  position: 2.02
  end
  # menu.add_item :assemblies,
  #               I18n.t("menu.assemblies", scope: "decidim.admin"),
  #               decidim_admin_assemblies.assemblies_path,
  #               icon_name: "dial",
  #               position: 2.2,
  #               active: is_active_link?(decidim_admin_assemblies.assemblies_path) ||
  #                       is_active_link?(decidim_admin_assemblies.assemblies_types_path) ||
  #                       is_active_link?(decidim_admin_assemblies.edit_assemblies_settings_path),
  #               if: allowed_to?(:enter, :space_area, space_name: :assemblies)
end
