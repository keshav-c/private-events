class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?  

  def current_user
    return nil if cookies.signed[:user_id].nil?

    @current_user ||= User.find(cookies.signed[:user_id])
  end

  def logged_in?
    !(current_user).nil?
  end
end
