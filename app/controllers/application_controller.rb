class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :login!, :logout!, :current_user, :consequences_of_not_logged_in

  def login!(user)
    user.reset_session_token!
    current_user
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    @current_user = nil
    reset_session
  end

  def consequences_of_not_logged_in
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def logged_in?
    return false if current_user.nil?
    true
  end

  def current_user
    @current_user = User.find_by_session_token(session[:session_token])
  end
end
