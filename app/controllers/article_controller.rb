class ArticleController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.where("published <= '#{Date.today}'").order(published: :desc)
  end

  def show
    @article = Article.find_by(parameterized: params[:id])
  end

  def new
    @article = Article.new
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
  end

  def update
    @article = @article = Article.find_by(parameterized: params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.parameterized)
    else
      render "edit"
    end
  end

  def destroy
    Article.find_by(parameterized: params[:id]).delete
    redirect_to root_path
  end

  private
    
    def article_params
      filtered = params.require(:article).permit(:title, :published, :content)
      filtered = filtered.merge(parameterized: params[:article][:title].parameterize)
      filtered
    end
end
