# frozen_string_literal: true

export_dropdown_text = <<~EOFEXPORT
  <%= export_dropdowns(query) %>
EOFEXPORT

Deface::Override.new(
  virtual_path: "decidim/solutions/admin/solutions/index",
  name: "add_export_dropdown_to_solutions_index",
  insert_before: "div.flex.items-center.gap-x-4",
  text: export_dropdown_text,
  original: "XXXXXXXXXXXX"
)