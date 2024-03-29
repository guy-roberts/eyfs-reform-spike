class ContentPagesController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page, only: %i[show edit update destroy]

  # GET /content_pages
  def index
    @content_pages = ContentPage.top_level.order_by_position
  end

  # GET /content_pages/1
  def show; end

  # GET /content_pages/new
  def new
    # If the new page is a child, pass through its parent id
    # Pages with a nil parent_id are top_level
    next_position = ContentPage.maximum("position") ? (ContentPage.maximum("position") + 1) : 1
    @content_page = ContentPage.new(parent_id: params[:parent_id], position: next_position)
  end

  # GET /content_pages/1/edit
  def edit
    @md = GovspeakToHtml.new.translate_markdown(@content_page.markdown)

    @content_page
  end

  # POST /content_pages
  def create
    @content_page = ContentPage.new(content_page_params)

    if @content_page.save
      redirect_to @content_page, notice: "Content page was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /content_pages/1
  def update
    if @content_page.update(content_page_params)
      redirect_to content_pages_path(@content_page), notice: "Content page was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /content_pages/1
  def destroy
    @content_page.destroy!
    redirect_to content_pages_url, notice: "Content page was successfully destroyed."
  end

  # POST of preview, returns html
  def preview
    Rails.logger.silence do
      html = GovspeakToHtml.new.translate_markdown(params["markdown"])

      render json: { html: html }
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_page
    @content_page = ContentPage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_page_params
    params.require(:content_page).permit(:title, :markdown, :parent_id, :position)
  end
end
