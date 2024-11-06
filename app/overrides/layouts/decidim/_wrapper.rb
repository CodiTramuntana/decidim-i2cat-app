# frozen_string_literal: true

Deface::Override.new(virtual_path: +"layouts/decidim/_wrapper",
                     name: "Set organization id in wrapper div data attributes",
                     insert_before: %q{div.off-canvas-wrapper},
                     text: %q{<div data-organization-id="<%= current_organization.id %>" />},
                     original: "e9c7043ff235d7f0cdce66a0445cafca5e4eec81")
