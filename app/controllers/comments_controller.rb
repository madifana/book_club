class CommentsController < ApplicationController
  before_action :auth_user, :library_finder

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      @message = @comment.errors.full_messages
    end
  end

  def index
    @comments = @library.comments
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @comments}
    end
  end

  private

  def library_finder
    @library = Library.find(params[:library_id])
  end

  def comment_params
    params.permit(:content, :user_id, :library_id, :id)
  end
end
