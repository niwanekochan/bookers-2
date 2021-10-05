class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(params[:book_id])
    else
      @user = book.user
      @newbook = Book.new
      @book = Book.find(params[:book_id])
      @book_comments = BookComment.all
      @book_comment = comment
      render 'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end
end
