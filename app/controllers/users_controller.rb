class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] =  "create success"
    end
  end

  private

  def user_params
    params.reuire(:user).permit(:name, :email)
  end
end
