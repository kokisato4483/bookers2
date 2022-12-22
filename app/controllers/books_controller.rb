class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @post.save
    redirect_to post_images_path
  end
  

  def index
  end

  def show
  end

  def edit
  end

  private

  def post_image_params
    params.require(:books).permit(:shop_name, :image, :caption)
  end