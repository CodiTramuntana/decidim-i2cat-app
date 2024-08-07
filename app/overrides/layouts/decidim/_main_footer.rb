# frozen_string_literal: true

i2cat_text = <<~I2CAT
  <section class="custom-footer" style="background: #fff;">
    <div class="row"><br/></div>
    <div class="row"">
      <div class="logos" style="display: flex;justify-content:space-between;align-items:center;">
        <div class="medium-2 small-12">
          <a rel="license" class="cc-badge part-logo-footer-gencat"
            href="http://www.gencat.cat" target="_blank">
            <%= image_pack_tag "media/images/logo_generalitat_catalunya.jpg" %>
          </a>
        </div>
        <div class="medium-2 small-12">
          <a rel="license" class="cc-badge part-logo-footer-gencat"
            href="https://i2cat.net/" target="_blank">
            <%= image_pack_tag "media/images/logo_I2CAT.jpg" %>
          </a>
        </div>
        <div class="medium-2 small-12 smart-catalonia-logo">
          <a rel="license" class="cc-badge part-logo-footer-gencat"
            href="http://smartcatalonia.gencat.cat/ca/inici/" target="_blank">
            <%= image_pack_tag "media/images/logo_SmartCatalonia.jpg" %>
          </a>
        </div>
      </div>
    </div>
    <div class="row"><br /></div>
  </section>
I2CAT
Deface::Override.new(virtual_path: +"layouts/decidim/_main_footer",
                     name: "i2cat_footer2",
                     insert_after: "div.main-footer",
                     text: "<section>#{i2cat_text}</section",
                     original: "25277dbf8f6306c2d1703a6fe82abf2be777fc7a")

feder_text = <<~EOFEDER
  <section class="footer__subhero extended subhero home-section footer-feder">
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
              <%= image_pack_tag "media/images/feder.png", alt: "FEDER" %>
            <% end %>
          </div>
        </div>
      </div>
    </div>
  </section>
EOFEDER

Deface::Override.new(virtual_path: +"layouts/decidim/_main_footer",
                     name: "feder_footer",
                     insert_after: "div.main-footer",
                     text: feder_text,
                     original: "25277dbf8f6306c2d1703a6fe82abf2be777fc7a")
