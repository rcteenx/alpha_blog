class ArticlesController < ApplicationController

  def show
    #byebug # debugs project...
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    # white list variables.
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    # redirect_to article_path(@article)
    redirect_to @article # short version of the previous code.
  end

end