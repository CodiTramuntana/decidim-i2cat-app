# frozen_string_literal: true

Decidim::PagesController.class_eval do
  alias_method :original_index, :index

  def index
    enforce_permission_to :read, :public_page

    case current_organization.host
    when "reptes.dca.cat"
      @topic = Decidim::StaticPageTopic.find_by("title->>'ca' = 'La DCA'")
      @page = current_organization.static_pages.first
      enforce_permission_to :read, :public_page, page: @page
      @pages = @topic&.pages

      render template: "decidim/pages/who_we_are"
    when "participa.challenge.cat"
      @page = Decidim::StaticPage.find_by(slug: "smartcataloniachallenge")
      redirect_to page_path(@page || StaticPage.take)
    else
      original_index
    end
  end
end
