require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  attr_reader :user, :new_article, :article

  def setup
    @user = create(:user)
    @article = create(:article)
    @new_article = attributes_for(:article)
  end

  test "root url" do
    get root_url
    assert_response :success
  end

  test "should show article" do
    get article_url article.parameterized
    assert_response :success
  end

  test "should create article" do
    signin user

    assert_difference "Article.count" do
      post articles_url, params: { article: new_article }
    end

    assert_redirected_to article_path Article.last.parameterized
  end

  test "invalid create article should render new" do
    signin user

    post articles_url, params: { article: new_article.without(:title) }

    assert_template :new
  end

  test "should update article" do
    signin user

    patch article_url article.parameterized, params: { article: { title: "New Title" } }
    assert_redirected_to article_path Article.last.parameterized

    article.reload

    assert_equal "New Title", article.title
  end

  test "invalid update article should render edit" do
    signin user

    patch article_url article.parameterized, params: { article: { title: "" } }
    assert_template :edit
  end

  test "should destroy article" do
    signin user

    assert_difference "Article.count", -1 do
      delete article_url article.parameterized
    end

    assert_redirected_to root_path
  end

  test "should new article" do
    signin user

    get new_article_url
    assert_response :success
  end


  test "should edit article" do
    signin user

    get edit_article_url article.parameterized
    assert_response :success
  end

  test "cannot create article unless logged in" do
    post articles_url, params: { article: new_article }
    assert_redirected_to new_user_session_url
  end

  test "cannot update article unless logged in" do
    patch article_url article.parameterized, params: { article: "New Title" }
    assert_redirected_to new_user_session_url
  end

  test "cannot new article unless logged in" do
    get new_article_url
    assert_redirected_to new_user_session_url
  end

  test "cannot edit article unless logged in" do
    get edit_article_url article.parameterized
    assert_redirected_to new_user_session_url
  end

  test "should have certain links with login" do
    signin user
    get root_url

    links = [
      new_article_path,
      destroy_user_session_path
    ]

    links.each do |link|
      assert_select "div.actions a[href=?]", link
    end

    assert_select "div.actions a[href=?][data-method=delete]", article_path(article.parameterized), { count: 0 }
  end

  test "should have certain links with login on article" do
    signin user
    get article_url article.parameterized

    links = [
      new_article_path,
      destroy_user_session_path,
      edit_article_path(article.parameterized)
    ]

    links.each do |link|
      assert_select "div.actions a[href=?]", link
    end

    assert_select "div.actions a[href=?][data-method=delete]", article_path(article.parameterized)
  end

  test "should see hidden article when signed in" do
    signin user

    create(:article, hidden: true, title: "this is a hidden article")

    get root_url
    assert_select "div.title-index > a", "this is a hidden article"
  end

  test "should not see hidden article without sign in" do
    create(:article, hidden: true, title: "this is a hidden article")

    get root_url
    assert_select "div.title-index > a", count: 0, text: "this is a hidden article"
  end

  test "cannot create two articles with the same title" do
    create(:article, hidden: true, title: "this is a hidden article")
    test_article = attributes_for(:article, title: "this is a hidden article")

    
    assert_difference "Article.count", 0 do
      post articles_url, params: { article: test_article }
    end
  end

  test "cannot create two articles with the same parameterized name" do
    create(:article, hidden: true, title: "this is a hidden article")
    test_article = attributes_for(:article, title: "this is a HIDDEN article")

    
    assert_difference "Article.count", 0 do
      post articles_url, params: { article: test_article }
    end
  end

  test "when deleting article should destroy all associated screenshots" do
    signin user

    create(:screenshot, article: article)
    create(:screenshot, article: article)
    create(:screenshot, article: article)

    assert_equal Screenshot.all.count, 3

    delete article_url article.parameterized

    assert_equal Screenshot.all.count, 0
  end

  test "hidden articles should not be shown" do
    create(:article, hidden: true, title: "I'm hidden")
    get root_url
    assert_select "a", text: /I'm hidden/, count: 0
  end
end
