class LibraryBooksController < ApplicationController
  before_action :auth_user, :library_finder

  def index
    @library_id = params[:library_id].to_i
    @library_books = LibraryBook.where(library_id: @library_id)
  end

  def update
    @library_books = @library.library_books
    @bk = @library_books.find_by(book_id: params[:id])
    @bk.update(library_books_params)
    redirect_to library_path(@library.id)
  end

  def edit
    @library_book = @library.library_books
    @bk = @library_book.find_by(book_id: params[:id])
  end

  private

  def library_finder
    @library = Library.find(params[:library_id])
  end

  def library_books_params
    params.permit(:quantity)
  end
end
