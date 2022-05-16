class Admin::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :genre_id)
  end
end
