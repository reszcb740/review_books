class Public::BookmarksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    bookmark = @book.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
