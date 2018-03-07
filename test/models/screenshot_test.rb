require 'test_helper'

class ScreenshotTest < ActiveSupport::TestCase

  attr_reader :article

  def setup
    @article = create(:article)
  end

  test "valid with valid attributes / valid factory" do
    assert build(:screenshot, article: article).valid?  
  end

  test "invalid with no article" do
    assert_not build(:screenshot, article: nil).valid?  
  end

  test "invalid with no file" do
    assert_not build(:screenshot, image: nil).valid?  
  end

  test "image url" do
    screenshot = create(:screenshot, article: article)
    assert screenshot.image.url.match /\/image\/[a-z0-9]{20}\?/
  end
end
