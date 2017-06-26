class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    request.env['omniauth.origin'] || libraries_path
  end
  
end
