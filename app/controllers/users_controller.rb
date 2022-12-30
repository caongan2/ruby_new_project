class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :login, :accept, :create, :password_digest, :data]
  skip_before_action :isAdminUser, only: [:new, :login, :accept, :create, :password_digest, :data, :logout]
  def new
  end

  def index
    username = params[:name]
    @users = username ? User.where(username: params[:name]) : User.all
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end
  def login

  end

  def accept
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to controller: 'posts', action: 'index'
    else
      redirect_to action: 'new'
    end
  end
  def create
    data[:password] = password_digest
    @user = User.new(data)
    # @user.email = params[:email]
    # @user.username = params[:username]
    # @user.password = password_digest
    if @user.save
      redirect_back(fallback_location: '')
    else
      puts 11111
    end
  end

  def password_digest
    params[:password]
  end
  def data
    params.permit(:email, :username, :password, :is_admin)
  end
end
