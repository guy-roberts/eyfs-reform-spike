class ContentPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content_page, only: [:show, :edit, :update, :destroy]

  # GET /content_pages
  def index
    @content_pages = ContentPage.all
  end

  # GET /content_pages/1
  def show
  end

  # GET /content_pages/new
  def new
    @content_page = ContentPage.new
  end

  # GET /content_pages/1/edit
  def edit
  end

  # POST /content_pages
  def create
    @content_page = ContentPage.new(content_page_params)

    if @content_page.save
      redirect_to @content_page, notice: 'Content page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /content_pages/1
  def update
    if @content_page.update(content_page_params)
      redirect_to @content_page, notice: 'Content page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /content_pages/1
  def destroy
    @content_page.destroy
    redirect_to content_pages_url, notice: 'Content page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_page
      @content_page = ContentPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_page_params
      params.require(:content_page).permit(:title, :slug, :markdown, :seo)
    end
end
