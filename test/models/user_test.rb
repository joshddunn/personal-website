require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid user factory" do
    assert build(:user).valid?
  end
end
