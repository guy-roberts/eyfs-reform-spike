class StaticPagesController < ApplicationController
  layout "cms"
  before_action :authenticate_user!

  def show
  end

  private

  def static_page_params
    params.require(:static_page).permit(:name)
  end

end
