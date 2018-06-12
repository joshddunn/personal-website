# article helper
module ArticleHelper
  def pinned_icon(article)
    fa_icon 'star' if article.pinned
  end

  def hidden_icon(article)
    fa_icon 'eye-slash' if article.hidden
  end
end
