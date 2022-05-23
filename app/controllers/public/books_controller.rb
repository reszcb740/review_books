class Public::BooksController < ApplicationController
  def new
    @book = Book.new
    @genres = Genre.all
  end
  def create
   @book = Book.new(book_params)
   @book.customer_id = current_customer.id
   @book.save
   redirect_to books_path
  end

  def index
    @books = Book.all
    @customer = current_customer
    @book_book_comment_ranks = Book.where(id: BookComment.group(:book_id).order('count(book_id) desc').pluck(:book_id)).limit(3)
  end

  def show
    @book = Book.find(params[:id])
    @customer = @book.customer
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    @book.customer = current_customer
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def search
    searched_genre_ids = Genre.looks(params[:search], params[:word]).pluck(:id)
    @search_genres = Book.where(genre_id: searched_genre_ids)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :genre_id, :customer_id, :star)
  end
end
