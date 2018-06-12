require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  attr_reader :user

  def setup
    @user = create(:user)
  end

  test 'valid with valid attributes / valid factory' do
    assert build(:resume, user: user).valid?
  end

  test 'invalid with no user' do
    assert_not build(:resume, user: nil).valid?
  end

  test 'invalid with no pdf' do
    assert_not build(:resume, pdf: nil).valid?
  end
end
