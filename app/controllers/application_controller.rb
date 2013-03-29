class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_logged_in, :current_user
  
  def user_logged_in
    if cookies[:username].nil?
      false
    else
      true
    end
  end
  
  def current_user
    @current_user = User.find(cookies[:_id])
  end
  
end
