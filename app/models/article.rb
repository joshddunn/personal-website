class Article < ApplicationRecord

  before_validation :generate_markdown
  before_validation :parameterize_title

  validates :title, presence: true, uniqueness: true
  validates :parameterized, presence: true, uniqueness: true
  validates :content, presence: true
  validates :markdown, presence: true
  validates :published, presence: true

  has_many :screenshots, dependent: :destroy

  private

    class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygments.css(:style => "monokai")
        Pygments.highlight(code, lexer:language)
      end
    end

    def generate_markdown
      options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true
      }

      translator = Redcarpet::Markdown.new(HTMLwithPygments, options)
      self.markdown =  translator.render(self.content)
    end

    def parameterize_title
      self.parameterized = self.title.to_s.parameterize
    end
end
