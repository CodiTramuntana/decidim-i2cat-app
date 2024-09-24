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
end
