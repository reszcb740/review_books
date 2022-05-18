class Admin::BookCommentsController < ApplicationController

  def create
   @book = Book.find(pramas[:book_id])
   comment = current_customer.book_comments.new(book_comment_params)
   comment.book_id = @book.id
   comment.save
   @book_comment = BookComment.new
  end

  def destroy
   @book = Book.find(params[:book_id])
   @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
   @book_comment.destroy
   @book_comment = BookComment.new
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id)
  end
end
