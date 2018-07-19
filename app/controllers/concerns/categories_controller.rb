class CategoriesController < ApplicationController
  def index 
    @categories = Category.paginate(page:params[:page],per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def show
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "you have created the category successfully"
      redirect_to categories_path
      
    else
      redirect_to 'new'
    end
  end
  
  private 
  def category_params
    params.require(:category).permit(:name)
  end
  
end