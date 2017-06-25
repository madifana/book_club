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

end
