module ArticleHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.css(:style => "monokai")
      Pygments.highlight(code, lexer:language)
    end
  end

  def markdown(content)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }

    markdown = Redcarpet::Markdown.new(HTMLwithPygments, options)
    return markdown.render(content)
  end
end
