class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login!, :logout!, :current_user, :consequences_of_not_logged_in

  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token
    @current_user = nil
  end

  def consequences_of_not_logged_in
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def logged_in?
    return true unless session[:session_token].nil?
    false
  end
  def current_user
    @current_user = User.find_by_session_token(session[:session_token])
    @current_user
  end
end
