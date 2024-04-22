# frozen_string_literal: true

Deface::Override.new(virtual_path: +"layouts/decidim/_application",
                     name: "set organization host in data attributes",
                     add_to_attributes: "body",
                     attributes: { "data-organization-id": "<%= current_organization.id %>" },
                     original: "41930cfb2025a54579e900288234b4b6e3e8aa04")
