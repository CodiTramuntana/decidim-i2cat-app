# frozen_string_literal: true

Deface::Override.new(virtual_path: +"layouts/decidim/_head",
                     name: "import decidim_application js",
                     insert_after: "erb[loud]:contains('organization_colors')",
                     text: "<%= javascript_pack_tag 'decidim_application', defer: false %>",
                     original: "95883a0c4ae5098c19a3b1016ac02ba1a698b55e")
