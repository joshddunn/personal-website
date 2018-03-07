require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "valid with valid attributes / valid factory" do
    assert build(:article).valid?
  end

  test "invalid with no title" do
    assert_not build(:article, title: "").valid?
  end

  test "invalid with no posted" do
    assert_not build(:article, published: nil).valid?
  end

  test "invalid with no content" do
    assert_not build(:article, content: "").valid?
  end

end
