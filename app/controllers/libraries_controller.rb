class LibrariesController < ApplicationController
  before_action :auth_user

  def index
    @sorted_libraries = Library.sort_by_rating
  end
end
