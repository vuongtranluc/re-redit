class UsersController < ApplicationController
  def index
    @users = User.all 
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:user][:username], email:params[:user][:email], email_confirmation:params[:user][:email_confirmation], password:params[:user][:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :email_confirmation, :password)
  end

end
