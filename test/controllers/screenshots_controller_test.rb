require 'test_helper'

class ScreenshotsControllerTest < ActionDispatch::IntegrationTest

  attr_reader :user, :article, :screenshot, :new_screenshot

  def setup
    @user = create(:user)
    @article = create(:article)
    @screenshot = create(:screenshot, article: article)
    @new_screenshot = attributes_for(:screenshot, article_id: article.id)
  end

  test "should create screenshot" do
    signin user
    assert_difference "Screenshot.count" do
      post screenshots_url, params: { screenshot: new_screenshot }, xhr: true
    end
  end

  test "should destroy screenshot" do
    signin user

    assert_difference "Screenshot.count", -1 do
      delete screenshot_url screenshot.id, xhr: true
    end
  end

  test "must be logged in to create screenshot" do
    post screenshots_url, params: { screenshot: new_screenshot }, xhr: true
    assert_response 401 
  end

  test "must be logged in to destroy screenshot" do
    delete screenshot_url screenshot.id, xhr: true
    assert_response 302
  end
end
