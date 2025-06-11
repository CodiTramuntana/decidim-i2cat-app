# frozen_string_literal: true

feder_text = <<~EOFEDER
  <style>
    .footer__subhero .footer-flex {
      display: flex;
      align-items: center;
      gap: 2rem;#{"      "}
    }
  #{"  "}
    .footer__subhero .footer-text {
      flex: 1;
      text-align: center;
    }

    .footer__subhero .footer-logo {
      flex: 0 0 300px;
    }

    .footer__subhero .footer-logo img {
      width: 100%;
      height: auto;
    }

    .p4 {
      padding-top: 4rem;
      padding-bottom: 4rem;
    }
  </style>

  <section class="footer__subhero extended subhero home-section footer-feder p4 bg-white" style="background-color: #fafbfd;">
    <div class="container mx-auto px-4">
      <div class="footer-flex">
  #{"      "}
        <div class="footer-text">
          <%= t("decidim.pages.home.feder.description") %>
        </div>

        <div class="footer-logo">
          <%= link_to "/", class: "block" do %>
            <%= image_pack_tag "media/images/feder.png", alt: "FEDER" %>
          <% end %>
        </div>

      </div>
    </div>
  </section>
EOFEDER

Deface::Override.new(virtual_path: +"layouts/decidim/footer/_main",
                     name: "feder_footer",
                     insert_before: "div.main-footer",
                     text: feder_text,
                     original: "827507cd54279c420c8aeeea0a7dd1d4d742b08e")

i2cat_text = <<~I2CAT
  <style>
     .custom-footer .logo-container {
       display: flex;
       flex-wrap: wrap;
       justify-content: space-between;
       gap: 2rem;
       align-items: center;
     }

     .custom-footer .logo-left {
       text-align: left;
       width: 8rem;
     }

     .custom-footer .logo-center {
       text-align: center;
       width: 8rem;
     }

     .custom-footer .logo-right {
       text-align: right;
       width: 8rem;
     }

     .custom-footer .logo-container img {
       width: 100%;
       height: auto;
     }
   </style>

   <section class="custom-footer bg-white py-8">
     <div class="container mx-auto px-4">
       <div class="logo-container">
  #{"       "}
         <div class="logo-left">
           <a rel="license" href="http://www.gencat.cat" target="_blank">
             <%= image_pack_tag "media/images/logo_generalitat_catalunya.jpg", alt: "Generalitat de Catalunya Logo" %>
           </a>
         </div>

         <div class="logo-center">
           <a rel="license" href="https://i2cat.net/" target="_blank">
             <%= image_pack_tag "media/images/logo_I2CAT.jpg", alt: "I2CAT Logo" %>
           </a>
         </div>

         <div class="logo-right">
           <a rel="license" href="http://smartcatalonia.gencat.cat/ca/inici/" target="_blank">
             <%= image_pack_tag "media/images/logo_SmartCatalonia.jpg", alt: "SmartCatalonia Logo" %>
           </a>
         </div>

       </div>
     </div>
   </section>
I2CAT
Deface::Override.new(virtual_path: +"layouts/decidim/footer/_main",
                     name: "i2cat_footer2",
                     insert_before: "div.main-footer",
                     text: "<section>#{i2cat_text}</section",
                     original: "827507cd54279c420c8aeeea0a7dd1d4d742b08e")
