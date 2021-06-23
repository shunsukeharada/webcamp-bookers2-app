class BooksController < ApplicationController
  
  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to books_path
  end
  
  def index
     @post_books = Book.all
  end
  
  def show
    @post_book = Book.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
