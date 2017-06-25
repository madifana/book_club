class LibraryBooksController < ApplicationController
  before_action :auth_user, :library_finder

  def index
    @library_id = params[:library_id].to_i
    @library_books = LibraryBook.where(library_id: @library_id)
  end

end
