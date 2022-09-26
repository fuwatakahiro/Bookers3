class UsersController < ApplicationController
  before_action :corrent_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "You have updated user successfully."
       redirect_to user_path(@user)
     else
       render :edit
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def corrent_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
