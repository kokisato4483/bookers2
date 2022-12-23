class BooksController < ApplicationController

before_action :correct_book, only: [:edit]


  def create
    p "in create"
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      p "success"
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully created"
    else
      p "fail"
      @books = Book.all
      @user = current_user
      render action: :index #indexを指定
    end
  end


  def index
      @user = current_user
      @book = Book.new
      @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      flash[:notice] = "error"
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private



  def book_params
    params.require(:book).permit(:title, :body)
  end

 def correct_book
    book = Book.find(params[:id])
    if book.user_id != current_user.id
      redirect_to books_path
    end
  end

end