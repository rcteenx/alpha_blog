class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #byebug # debugs project...
    # set_article @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # set_article @article = Article.find(params[:id])
  end

  def create
    # white list variables.
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was created successfully."
      # redirect_to article_path(@article)
      redirect_to @article # short version of the previous code.
    else
      # render the same form again with validation error messages.
      render 'new' 
    end 
  end

  def update
    # set_article @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else 
      render 'edit'
    end
  end

  def destroy
    # set_article @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  # Cannot be used from outside
  private
  # anthing below this is private.

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end