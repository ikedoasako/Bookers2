class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @user = current_user
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    unless correct_user.id == @user.id
      redirect_to user_path(current_user.id)
    end
    if @user.update(user_params)
        flash[:notice] = "You have updated user successfully"
        redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :get_profile_image, :introduction)
  end

end
