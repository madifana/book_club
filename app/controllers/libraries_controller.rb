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

  def create
    @library = Library.create(library_params)

    if @library.save
      redirect_to library_path(@library)
    else
      @message = @library.errors.full_messages
      render :new
    end
  end

  def show
    @library = Library.find(params[:id])
    @comment = Comment.new
  end

  private

  def library_params
    params.require(:library).permit(:user_id, :name, :rating, :description, book_ids: [], books_attributes: [:book_name])
  end
end
