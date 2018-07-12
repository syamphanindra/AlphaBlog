class ArticlesController < ApplicationController
  before_action :set_article , only: [:edit,:update,:show,:destroy]
  def index
    @articles = Article.all
  end
 
  def new
    @article = Article.new
  end
  
  def edit
    #article will be initialized by before_action
  end
  
  def destroy
    #article will be initialized by before_action
    if @article.destroy
      flash[:notice] = "Article is destroyed Successfully"
      redirect_to articles_path
    end
    
  end
  
  def update
    #article will be initialized by before_action
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
    
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
#     @article.save
#     redirect_to articles_path(@article)
    if @article.save
       #do something
      flash[:notice] = "Article was succussfully created" #notice
      redirect_to article_path(@article)
    else
      #do something
      render :new # you can use 'new' also
    end
  end
  
  def show
    
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
      
    def article_params
      params.require(:article).permit(:title,:description)
    end
end