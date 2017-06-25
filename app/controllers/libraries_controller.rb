class LibrariesController < ApplicationController
  before_action :auth_user

  def index
    @sorted_libraries = Library.sort_by_rating
  end

  def new
    @library = Library.new
    @book = Book.new
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    @book.update(book_params)
    redirect_to library_path(@library)
  end
end
