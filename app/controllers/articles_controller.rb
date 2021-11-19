class ArticlesController < ApplicationController

  def show
    #byebug # debugs project...
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end