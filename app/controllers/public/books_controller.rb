class Public::BooksController < ApplicationController
  def new
    @book = Book.new
    @genres = Genre.all
  end
  def create
   @book = Book.new(book.params)
   @book.customer_id = current_customer.id
   @book.save
   redirect_to public_books_path
  end

  def index
    @books = Book.all
    @customer = current_customer
  end

  def show
    @book = Book.find(book_params)
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :genre_id)
  end
end
