class ApplicationController < ActionController::Base
  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end
  
  def admin?
    current_user.nil? ? false : current_user.name == "admin"
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  helper_method :admin?, :current_user
end