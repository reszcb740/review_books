class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!
  def create
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.new(customer_id: current_customer.id)
    bookmark.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
    end
  end
end
