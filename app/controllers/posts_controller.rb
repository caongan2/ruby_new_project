class PostsController < ApplicationController
  skip_before_action :isAdminUser
  def index
    @auth = current_user
    @users = User.all
    @user = User.find(session[:user_id])
    @posts = Post.order('id DESC')
  end

  def show
    @auth = current_user
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    @image = @post.image
  end

  def update
    @post = Post.find(params[:id])
    @post.update(data)
    if params[:image]
      @post.image.attach(params[:image])
    end
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.delete
    redirect_to action: 'index'
  end

  def create
    @post = Post.new(data)
    @post.image.attach(params[:image])
    if @post.save
      redirect_to action: 'index'
    end
  end

  private
  def data
    params.permit(:title, :content, :user_id, :image)
  end
end
