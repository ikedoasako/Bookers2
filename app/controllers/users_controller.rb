class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
  end

  def index
  end

end
