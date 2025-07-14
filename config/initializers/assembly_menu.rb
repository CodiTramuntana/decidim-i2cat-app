# frozen_string_literal: true

Decidim.menu :admin_assembly_menu do |menu|
  menu.add_item :followers,
                "Followers",
                Rails.application.routes.url_helpers.assembly_followers_path(current_participatory_space),
                icon_name: "user-settings-line",
                position: 15,
                if: allowed_to?(:read, :moderation, assembly: current_participatory_space)
end
