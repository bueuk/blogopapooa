class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :index_posts]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @category = Category.new(resources_params)
    
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update(resources_params)
      redirect_to categories_path
    else
      render 'edit'
    end

  end

  def destroy 
    @category = Category.friendly.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else
      flash[:notice] = 'Something wrong'
    end
    
  end

  def index_posts
    @category = Category.friendly.find(params[:id])
    @index_posts = @category.blog_posts.order(id: :desc).paginate( per_page: 5, page: params[:page] )
  end

  private

  def resources_params
    params.require(:category).permit(:name)
  end

end
