class UsersController < ApplicationController
  def new
  end
  def login

  end

  def accept
    @user = User.find_by(authenticate)
    if @user
      redirect_to controller: 'posts', action: 'index'
    else
      # redirect_ ''
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

  private
  def password_digest
    params[:password]
  end
  def data
    params.permit(:email, :username, :password)
  end
  def authenticate
    params.permit(:username, :password_digest)
  end
end
