require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest

  attr_reader :user

  def setup
    @user = create(:user)
  end

  test "no logout link when not logged in" do
    get root_url
    assert_select "a[href=?]", destroy_user_session_path, count: 0
  end

  test "logout link when logged in" do
    signin user
    get root_url
    assert_select "a[href=?]", destroy_user_session_path
  end

end
