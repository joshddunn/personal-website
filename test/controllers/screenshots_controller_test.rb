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

    assert_equal 'text/javascript', @response.content_type
  end

  test "should destroy screenshot" do
    signin user

    assert_difference "Screenshot.count", -1 do
      delete screenshot_url screenshot.id, xhr: true, format: :js
    end

    assert_equal 'text/javascript', @response.content_type
  end

  test "must be logged in to create screenshot" do
    post screenshots_url, params: { screenshot: new_screenshot }
    assert_redirected_to new_user_session_url
  end

  test "must be logged in to destroy screenshot" do
    delete screenshot_url screenshot.id
    assert_redirected_to new_user_session_url
  end
end
