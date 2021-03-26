# frozen_string_literal: true

feder_text = <<~EOFEDER
  <section class="footer__subhero extended subhero home-section">
    <div class="row">
      <div class="columns small-12 large-9">
        <div class="row">
          <div class="small-10 medium-12 columns small-centered large-uncentered m-bottom">
            <%= t("decidim.pages.home.feder.description") %>
          </div>
        </div>
      </div>
      <div class="columns small-12 large-3 end">
        <div class="row">
          <div class="small-8 medium-6 large-12 columns small-centered ">
            <%= link_to "/", class: "part-logo-footer-feder" do %>
              <%= image_tag "feder.png", alt: "FEDER" %>
            <% end %>
          </div>
        </div>
      </div>
    </div>
  </section>
EOFEDER

Deface::Override.new(virtual_path: +'layouts/decidim/_main_footer',
                     name: 'feder_footer',
                     insert_after: 'div.main-footer',
                     text: feder_text)
