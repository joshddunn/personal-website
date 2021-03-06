require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  attr_reader :user, :new_resume, :resume

  def setup
    @user = create(:user)
    @resume = create(:resume, user: user)
    @new_resume = attributes_for(:resume, user: user)
  end

  test 'can new resume when logged in' do
    signin user
    get new_resume_url
    assert_response :success
  end

  test 'can create resume when logged in' do
    signin user
    assert_difference 'Resume.count' do
      post resumes_url, params: { resume: new_resume }
    end
    assert_redirected_to root_path
  end

  test 'can delete resume when logged in' do
    signin user
    assert_difference 'Resume.count', -1 do
      delete resume_url resume
    end
    assert_redirected_to root_path
  end

  test 'cannot new resume unless logged in' do
    get new_resume_url
    assert_redirected_to new_user_session_url
  end

  test 'cannot create resume unless logged in' do
    post resumes_url, params: { resume: new_resume }
    assert_redirected_to new_user_session_url
  end

  test 'cannot delete resume unless logged in' do
    delete resume_url resume
    assert_redirected_to new_user_session_url
  end

  test 'with resume resume link is shown' do
    get root_url
    assert_select 'a[href=?]', resume.pdf.url
  end

  test 'without resume resume link is not shown' do
    resume.destroy
    get root_url
    assert_select 'a[href=?]', resume.pdf.url, count: 0
  end
end
