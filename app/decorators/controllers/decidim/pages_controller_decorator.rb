Decidim::PagesController.class_eval do
  alias_method :original_index, :index

  def index
    if current_organization.host == "reptes.dca.cat"
      @topic = Decidim::StaticPageTopic.find_by("title->>'ca' = 'La DCA'")
      @page = current_organization.static_pages.first
      enforce_permission_to :read, :public_page, page: @page
      @pages = @topic&.pages
    else
      original_index
    end
  end
end
