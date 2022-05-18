class Admin::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    @book.customer = current_customer
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to admin_books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :customer_id, :star)
  end
end
