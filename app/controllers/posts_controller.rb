class PostsController < ApplicationController
  skip_before_action :isAdminUser
  def index
    @user = User.find(session[:user_id])
    @posts = Post.order('id DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(data)
      redirect_to @post
    end
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
