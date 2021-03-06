require "rails_helper"

RSpec.describe "Contents", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user)
  end

  let(:a_page) do
    FactoryBot.create(:content_page)
  end

  describe "GET /show" do
    it "renders a final page as html" do
      get content_page_url(a_page)
      expect(response).to be_successful
    end
  end

  describe "GET /" do
    it "renders the landing page / hub page" do
      get "/content"
      expect(response).to be_successful
    end

    xit "renders the desktop menu of content pages, two levels, in correct order" do
    end

    xit "renders the mobile menu of content pages, two levels, in correct order" do
    end
  end
end
