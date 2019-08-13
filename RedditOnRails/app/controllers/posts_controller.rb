class PostsController < ApplicationController

  before_action :require_logged_in 

  def new
    @post = Post.new
    # @post.sub_id = params[:sub_id] 
    render :new
  end

  def create 
    @post = Post.new(post_params)
    @post.author_id = current_user.id 

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def index
    @posts = Post.all
    render :index
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
