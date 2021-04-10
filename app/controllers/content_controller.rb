class ContentController < ApplicationController
  # require "../services/govspeak_to_html"

  layout "content"

  # This is a page whose title and children's titles are rendered in
  # a block in the landing_page_layout template
  FEATURED_PAGE_TITLE = "Get help to improve your practice".freeze

  # GET /page_title
  def show
    begin
      @page = ContentPage.find_by_slug!(params["slug"])
    rescue ActiveRecord::RecordNotFound
      not_found
    end

    if @page.parent
      if params["section"] != @page.parent.slug
        return not_found
      end
    end

    @markdown = GovspeakToHtml.new.translate_markdown(@page.markdown)
    @page
  end

  # GET /
  def index
    # Redirect to show the first page
    redirect_to "/" + ContentPage.first.full_path
  end

private

  def content_params
    params.require(:content_page).permit(:section, :slug)
  end
end
