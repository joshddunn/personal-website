class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    hidden = user_signed_in? ? "" : "and hidden = false"
    @articles = Article.where("published <= '#{Date.today}' #{hidden}").order(hidden: :desc, published: :desc)
  end

  def show
    @article = Article.find_by(parameterized: params[:id])
    redirect_to root_path if @article.hidden && !user_signed_in?
  end

  def new
    @article = Article.new(hidden: true)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article.parameterized)
    else
      render "new"
    end
  end

  def edit
    @article = Article.find_by(parameterized: params[:id])
    @screenshot = Screenshot.new(article_id: @article.id)
  end

  def update
    @article = Article.find_by(parameterized: params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.parameterized)
    else
      @screenshot = Screenshot.new(article_id: @article.id)
      render "edit"
    end
  end

  def destroy
    Article.find_by(parameterized: params[:id]).destroy
    redirect_to root_path
  end

  private
    
    def article_params
      filtered = params.require(:article).permit(:title, :published, :content, :hidden)
      filtered = filtered.merge(parameterized: filtered[:title].parameterize) if filtered.key?(:title)
      filtered = filtered.merge(content: "Write your article here!") unless filtered.key?(:content)
      filtered = filtered.merge(markdown: helpers.markdown(filtered[:content])) if filtered.key?(:content)
      filtered
    end
end
