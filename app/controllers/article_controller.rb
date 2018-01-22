class ArticleController < ApplicationController
  def index
    @articles = Article.where("published <= '#{Date.today}'").order(published: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render "show"
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = @article = Article.find(params[:id])
    if @article.update(article_params)
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    Article.find(params[:id]).delete
    redirect_to root_path
  end

  private
    
    def article_params
      params.require(:article).permit(:title, :published, :content)
    end
end
