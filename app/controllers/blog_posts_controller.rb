class BlogPostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :show_all]

  def index
    if params[:search]
      @posts = BlogPost.where('title like ?', "%#{params[:search]}%")
    else
      @posts = BlogPost.order(sticky_order: :asc).order(id: :desc)
    end
    @posts = @posts.paginate( per_page: 4, page: params[:page] )
  end

  def show
    @post = BlogPost.friendly.find(params[:id])
    @categories = @post.categories 
  end

  def new
    @post = BlogPost.new
    @maximum_length = BlogPost.validators_on( :description ).second.options[:maximum]
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @post = BlogPost.new(resource_params)
    @post.user = current_user

    if params[:submit_publish]
      @post.published = 1
    else
      @post.published = 0
    end

    if @post.save
      if @post.published?
        flash[:notice] = 'Your post successfully published!'
        render 'new'
      else
        flash[:notice] = 'Save as draft success! your post will hide from public'
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @post = BlogPost.friendly.find(params[:id])
    @maximum_length = BlogPost.validators_on( :description ).second.options[:maximum]
    @categories = Category.all
  end

  def update
    @post = BlogPost.friendly.find(params[:id])
    @categories = Category.all

    if params[:submit_publish]
      @post.published = 1
    else
      @post.published = 0
    end

    if @post.update(resource_params)
      if @post.published?
        flash[:notice] = 'Your post successfully updated!'
        render 'edit'
      else
        flash[:notice] = 'Save as draft success! your post will hide from public'
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @post = BlogPost.friendly.find(params[:id])
    @post.destroy
    redirect_to request.referrer
  end
  
  # my Custom method
  def pinit
    @post = BlogPost.friendly.find(params[:id])
    @post.pinit!
    redirect_to root_path
  end

  def unpin
    @post = BlogPost.friendly.find(params[:id])
    @post.unpin!
    redirect_to root_path
  end

  def show_all 
    @posts = BlogPost.order(id: :desc)
    @posts = @posts.paginate( per_page: 10, page: params[:page] )
  end

  # strong params
  private

  def resource_params
    params.require(:blog_post).permit(:title, :description, :content, :published, :category_ids => [])
  end
end
