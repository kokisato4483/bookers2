class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  
  def edit
     @user = User.find(params[:id])
  end

end
