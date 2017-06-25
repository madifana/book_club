class BooksController < ApplicationController
  before_action :auth_user

  def index
    @books = Book.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @books}
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      @message = @book.errors.full_messages
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @book}
    end
  end

  private

  def book_params
    params.require(:book).permit(:id, :book_name)
  end
end
