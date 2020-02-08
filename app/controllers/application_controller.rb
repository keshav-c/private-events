class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?  

  def current_user
    return nil if cookies.signed[:user_id].nil?

    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def logged_in?
    !(current_user).nil?
  end

  def user_logged_in
    unless logged_in?
      flash[:danger] = "You need to log in before creating events"
      redirect_to root_url
    end
  end
end
