class UsersController < ApplicationController

	 before_action :correct_user, only: [:edit]


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully"
        redirect_to user_path(@user.id)
      else
        render action: :edit
      end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end


  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end


  def correct_user
      user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end
end
