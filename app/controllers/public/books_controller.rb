class Public::BooksController < ApplicationController
  def new
    @book = Book.new
    @genres = Genre.all
  end
  def create
   @book = Book.new(book_params)
   @book.customer_id = current_customer.id
   @book.save
   redirect_to public_books_path
  end

  def index
    @books = Book.all
    @customer = current_customer
  end

  def show
    @book = Book.find(params[:id])
    @customer = @book.customer
    @book_new = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    @book.customer = current_customer
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to public_books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to public_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :customer_id)
  end
end
